class Public::CommentsController < ApplicationController
  def create
    facility_post = FacilityPost.find(params[:facility_post_id])
    comment = facility_post.comments.new(comment_params)
    comment.user = current_user  # コメントにユーザーを関連付ける
    comment.save
    redirect_to request.referer
  end
  
  def destroy
    comment = BookComment.find(params[:id])
    comment.destroy
    redirect_to request.referer
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
