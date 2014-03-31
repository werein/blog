class ChangeContentToHtmlOnBlogPosts < ActiveRecord::Migration
  def change
    rename_column :blog_post_translations, :content, :html
  end
end
