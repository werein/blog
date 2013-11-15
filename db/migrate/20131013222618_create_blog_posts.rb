class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :image
      t.string :image_tmp
      t.boolean :published
      t.timestamps
    end
    create_table :blog_post_translations do |t|
      t.references :blog_post, index: true
      t.string  :locale, null: false
      t.string  :slug
      t.string  :title
      t.string  :content
      t.timestamps
    end

    add_index :blog_post_translations, :locale
    add_index :blog_post_translations, :slug, unique: true
  end

  # We can't use (yet) Globalize helper for generating translations
  # def up
  #   create_table :blog_posts do |t|
  #     t.string :image
  #     t.string :image_tmp
  #     t.timestamps
  #   end
  #   Blog::Post.create_translation_table! title: :string, content: :text
  # end
  # def down
  #   drop_table :blog_posts
  #   Blog::Post.drop_translation_table!
  # end
end