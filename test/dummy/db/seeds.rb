# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development? and Blog::Post.count == 0
  category = Blog::Category.create!(
    active: true,
    translations_attributes: [{ title: 'Apple', locale: 'cs', slug: 'apple', content: 'Apple je společnost z USA' },
                              { title: 'Apple', locale: 'en', slug: 'apple', content: 'Apple is american company'} ])
  
  Blog::Post.create!(
    published: true,
    translations_attributes: [{ title: 'Apple iPhone', locale: 'cs', slug: 'apple-iphone', content_type: 'html', html: 'Mobilní telefon od společnosti Apple' },
                              { title: 'Apple iPhone', locale: 'en', slug: 'apple-iphone', content_type: 'html', html: 'Mobile phone created by Apple'} ],
    category_ids: [category.id])
end