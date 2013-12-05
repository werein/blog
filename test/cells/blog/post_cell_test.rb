require 'test_helper'

module Blog
  class PostCellTest < Cell::TestCase
    it "should show posts" do
      post = create(:post)
      render_cell('blog/post', :show).must_include 'Apple iPhone'
    end

    it "should show related posts" do 
      category = create(:category)
      post1 = create(:post, categories: [category], translations: [ build(:post_translation, title: 'Apple iPhone 4') ])
      post2 = create(:post, categories: [category], translations: [ build(:post_translation, title: 'Apple iPhone 5') ])
      post3 = create(:post, translations: [ build(:post_translation, title: 'Apple iPad') ])

      render_cell('blog/post', :related, post: post1).wont_include 'Apple iPhone 4'
      render_cell('blog/post', :related, post: post1).must_include 'Apple iPhone 5'
      render_cell('blog/post', :related, post: post1).wont_include 'Apple iPad'
    end

    # it "should show categories" do 
    #   category = create(:category)
    #   render_cell('blog/posts', :categories).must_include 'Apple iPhone'
    # end
  end
end