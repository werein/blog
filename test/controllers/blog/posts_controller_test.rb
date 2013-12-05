require 'test_helper'

module Blog
  describe PostsController do  
    let(:category)          { create(:category) }
    let(:post_attr)         { attributes_for(:post, translations_attributes: [ attributes_for(:post_translation) ], category_ids: [ category.id ]).except(:translations, :categories) }
    let(:invalid_attr)      { attributes_for(:invalid_post) }
    let(:current_user)      { mock 'user' }

    before do
      can Blog::Post
      current_user.stubs(:manage?).returns(true)
      current_user.stubs(:xeditable?).returns(true)
      @post = create(:post)
    end

    it "should get index" do 
      get :index, use_route: :blog_engine
      assigns(:posts).wont_be_nil
      assert_response :success
      assert_template :index
    end

    it "should get new" do 
      get :new, use_route: :blog_engine
      assigns(:post).wont_be_nil
      assert_response :success
      assert_template :new
    end

    it "should create post w valid attributes" do 
      assert_difference('Blog::Post.count') do
        post :create, use_route: :blog_engine, post: post_attr
      end
      assigns(:post).errors.full_messages.must_be :empty?
      assert_response :redirect
      assert_redirected_to post_path(assigns(:post))
      assert_equal 'Post was successfully created.', flash[:notice]
    end

    it "shouldn't create post w invalid attributes" do 
      assert_no_difference('Blog::Post.count') do
        post :create, use_route: :blog_engine, post: invalid_attr
      end
      assigns(:post).errors.full_messages.wont_be :empty?
      assert_response :success
      assert_template :new
    end

    it "should show post" do 
      get :show, use_route: :blog_engine, id: @post
      assigns(:post).wont_be_nil
      assigns(:post).must_equal @post
      assert_response :success
      assert_template :show
    end

    it "should get edit" do 
      get :edit, use_route: :blog_engine, id: @post
      assigns(:post).wont_be_nil
      assigns(:post).must_equal @post
      assert_response :success
      assert_template :edit
    end

    it "should update post w valid attributes" do
      patch :update, use_route: :blog_engine, id: @post, post: { translations_attributes: [ attributes_for(:post_cs_translation) ] }
      assigns(:post).errors.full_messages.must_be :empty?
      assert_response :redirect
      assert_redirected_to post_path(assigns(:post))
      assert_equal 'Post was successfully updated.', flash[:notice]
    end

    it "shouldn't update post w invalid attributes" do
      patch :update, use_route: :blog_engine, id: @post, post: { translations_attributes: [ attributes_for(:post_translation) ] }
      assigns(:post).errors.full_messages.wont_be :empty?
      assigns(:post).must_equal @post
      assert_response :success
      assert_template :edit
    end

    it "should destroy post" do 
      assert_difference('Blog::Post.count', -1) do
        delete :destroy, use_route: :blog_engine, id: @post
      end
      assert_response :redirect
      assert_redirected_to posts_path
      assert_equal 'Post was successfully deleted.', flash[:notice]
    end
  end
end