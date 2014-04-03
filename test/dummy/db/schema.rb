# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140331172612) do

  create_table "blog_categories", force: true do |t|
    t.boolean  "active"
    t.string   "image"
    t.string   "image_tmp"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blog_categories", ["ancestry"], name: "index_blog_categories_on_ancestry"

  create_table "blog_categories_posts", id: false, force: true do |t|
    t.integer "category_id"
    t.integer "post_id"
  end

  create_table "blog_category_translations", force: true do |t|
    t.integer  "blog_category_id"
    t.string   "locale",           null: false
    t.string   "slug"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blog_category_translations", ["blog_category_id"], name: "index_blog_category_translations_on_blog_category_id"
  add_index "blog_category_translations", ["locale"], name: "index_blog_category_translations_on_locale"
  add_index "blog_category_translations", ["slug"], name: "index_blog_category_translations_on_slug"

  create_table "blog_post_translations", force: true do |t|
    t.integer  "blog_post_id"
    t.string   "locale",       null: false
    t.string   "slug"
    t.string   "title"
    t.text     "html"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "md_file"
    t.string   "md_file_tmp"
    t.string   "md_remote"
    t.string   "content_type"
  end

  add_index "blog_post_translations", ["blog_post_id"], name: "index_blog_post_translations_on_blog_post_id"
  add_index "blog_post_translations", ["locale"], name: "index_blog_post_translations_on_locale"
  add_index "blog_post_translations", ["slug"], name: "index_blog_post_translations_on_slug"

  create_table "blog_posts", force: true do |t|
    t.string   "image"
    t.string   "image_tmp"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

end
