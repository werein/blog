require 'test_helper'

require_dependency "blog/application_controller"

module Blog
  class StubbedController < ApplicationController
    def test_ability
      @ability = current_ability
      render nothing: true
    end
  end
   
  describe StubbedController do 
    before do
      user = mock('user')
      user.stubs(:has_role?).returns(false)
      @controller.stubs(:current_user).returns(user)
    end

    it 'something should return derp' do
      get :test_ability, use_route: :blog_engine
      assert_response :success
      assigns(:ability).must_be_instance_of(Blog::Ability)
    end
  end
end