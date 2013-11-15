require 'test_helper'

module Blog
  describe CategoriesController do  
    let(:category)        { create(:category) }
    let(:post)            { create(:post, categories: [category]) }
    let(:category_attr)   { attributes_for(:post, translations_attributes: [ attributes_for(:post_translation) ], category_ids: [ category.id ]).except(:translations, :categories) }
    let(:current_user)    { mock 'user' }

    before do
      can Blog::Category
      current_user.stubs(:manage?).returns(true)
      current_user.stubs(:xeditable?).returns(true)
    end

    it "should show category" do 
      get :show, use_route: :blog_engine, id: category.slug
      assert_response :success
      assert_template :show
      assigns(:category).wont_be_nil
      assigns(:category).must_equal category
      assigns(:posts).wont_be_nil
      assigns(:posts).must_equal category.posts
    end

    it "should update post w valid attributes" do
      patch :update, use_route: :blog_engine, id: category, category: { translations: [] }
      assert_response :redirect
      assert_redirected_to category_path(assigns(:category))
      assert_equal 'Category was successfully updated.', flash[:notice]
    end
  end
end
