class AddMarkdownToBlogPosts < ActiveRecord::Migration
  def change
    add_column :blog_post_translations, :md_file, :string
    add_column :blog_post_translations, :md_file_tmp, :string
    add_column :blog_post_translations, :md_remote, :string
    add_column :blog_post_translations, :content_type, :string
  end
end
