class CreateBlogCategories < ActiveRecord::Migration
  def change
    create_table :blog_categories do |t|
      t.boolean :active
      t.string  :image
      t.string  :image_tmp
      t.string  :ancestry
      t.timestamps
    end

    add_index :blog_categories, :ancestry

    create_table :blog_category_translations do |t|
      t.references :blog_category, index: true
      t.string  :locale, null: false
      t.string  :slug
      t.string  :title
      t.string  :content
      t.timestamps
    end

    add_index :blog_category_translations, :locale
    add_index :blog_category_translations, :slug, unique: true
  end
end