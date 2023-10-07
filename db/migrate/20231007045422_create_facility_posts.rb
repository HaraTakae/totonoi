class CreateFacilityPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :facility_posts do |t|
      t.integer:user_id, null: false
      t.integer:area_id, null: false
      t.string:name, null: false, index: true
      t.string:address, null: false
      t.text:introduction, null: false
      t.integer:star, null: false
      t.timestamps
    end
  end
end
