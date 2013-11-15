include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :user, class: Auth::User do 
    email 'test@gmail.com'
    password '12345678'
  end
end

FactoryGirl.define do
  factory :post, class: Blog::Post do
    # image { fixture_file_upload('test/data/mac.png') }
    translations {[ association(:post_translation), association(:post_cs_translation)]}
    categories {[ association(:category) ]}
  end

  factory :post_translation, class: Blog::Post::Translation do
    title 'Apple iPhone'
    sequence(:slug) {|n| "Apple iPhone #{n}" }
    locale 'en'
    content 'Apple iPhone is best phone ever'
  end

  factory :post_cs_translation, class: Blog::Post::Translation do
    title 'Apple iPhone'
    sequence(:slug) {|n| "Apple iPhone #{n}" }
    locale 'cs'
    content 'Apple iPhone je nejlepsi telefon'
  end

  factory :category, class: Blog::Category do 
    # image { fixture_file_upload('test/data/mac.png') }
    ancestry nil
    translations {[ association(:category_translation), association(:category_cs_translation) ]}
  end

  factory :category_translation, class: Blog::Category::Translation do
    title 'Apple iPhone'
    sequence(:slug) {|n| "Apple iPhone #{n}" }
    locale 'en'
    content 'All about apple iPhone'
  end

  factory :category_cs_translation, class: Blog::Category::Translation do
    title 'Apple iPhone'
    sequence(:slug) {|n| "Apple iPhone #{n}" }
    locale 'cs'
    content 'Vse ohledmne apple iPhone'
  end

  factory :invalid_post, parent: :post do 
    translations nil
  end
end