class ChangePostSlugToNotUnique < ActiveRecord::Migration
  def up
    remove_index :blog_post_translations, name: :index_blog_post_translations_on_slug
    remove_index :blog_category_translations, name: :index_blog_category_translations_on_slug
    add_index :blog_post_translations, :slug
    add_index :blog_category_translations, :slug
  end
end