require 'test_helper'

describe "Rails Admin Feature" do
  let(:current_user)  { FactoryGirl.create(:user) }
  before              { integration_login }
  after               { Warden.test_reset! }

  it "must have access to create new post" do 
    visit rails_admin.new_path(model_name: 'blog~post')
    within '#new_blog_post' do 
      page.has_content?('Image').must_equal true
      page.has_content?('Translations').must_equal true
      page.has_content?('Categories').must_equal true
    end
  end

  it "must have access to create new category" do 
    visit rails_admin.new_path(model_name: 'blog~category')
    within '#new_blog_category' do 
      page.has_content?('Parent').must_equal true
      page.has_content?('Image').must_equal true
      page.has_content?('Translations').must_equal true
      page.has_content?('Posts').must_equal false
    end
  end
end