class CreateCategoryPostJoinTable < ActiveRecord::Migration
  def change
    create_table :blog_categories_posts, id: false do |t|
      t.integer :category_id
      t.integer :post_id
    end
  end
end