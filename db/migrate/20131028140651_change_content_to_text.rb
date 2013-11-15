class ChangeContentToText < ActiveRecord::Migration
  def up
   change_column :blog_post_translations, :content, :text, limit: nil
   change_column :blog_category_translations, :content, :text, limit: nil
  end

  def down
   change_column :blog_post_translations, :content, :string
   change_column :blog_category_translations, :content, :string
  end
end
