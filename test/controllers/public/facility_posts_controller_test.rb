require "test_helper"

class Public::FacilityPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_facility_posts_index_url
    assert_response :success
  end

  test "should get new" do
    get public_facility_posts_new_url
    assert_response :success
  end

  test "should get show" do
    get public_facility_posts_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_facility_posts_edit_url
    assert_response :success
  end
end
