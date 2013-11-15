require "test_helper"

module Blog
  describe Ability do
    describe 'Anuathorized access' do 
      let(:ability) { Ability.new(nil) }

      describe 'Posts' do 
        it "can index posts"            do ability.can?(:index, :posts).must_equal true end
        it "can show posts"             do ability.can?(:show, Post.new).must_equal true end
        it "cannot edit posts"          do ability.cannot?(:edit, Post.new).must_equal true end
        it "cannot update posts"        do ability.cannot?(:update, Post.new).must_equal true end
        it "cannot delete posts"        do ability.cannot?(:delete, Post.new).must_equal true end
      end

      describe 'Categories' do 
        it "can show categories"        do ability.can?(:show, Category.new).must_equal true end
        it "cannot edit categories"     do ability.cannot?(:edit, Category.new).must_equal true end
        it "cannot update categories"   do ability.cannot?(:update, Category.new).must_equal true end
        it "cannot delete categories"   do ability.cannot?(:delete, Category.new).must_equal true end
      end
    end

    describe 'User access' do 
      let(:user)    { user_ability(:user) }
      let(:ability) { Ability.new(user) }
      let(:current_user) { mock 'user' }

      describe 'Posts' do 
        it "can index posts"            do ability.can?(:index, :posts).must_equal true end
        it "can show posts"             do ability.can?(:show, Post.new).must_equal true end
        it "cannot edit posts"          do ability.cannot?(:edit, Post.new).must_equal true end
        it "cannot update posts"        do ability.cannot?(:update, Post.new).must_equal true end
        it "cannot delete posts"        do ability.cannot?(:delete, Post.new).must_equal true end
      end

      describe 'Categories' do 
        it "can show categories"        do ability.can?(:show, Category.new).must_equal true end
        it "cannot edit categories"     do ability.cannot?(:edit, Category.new).must_equal true end
        it "cannot update categories"   do ability.cannot?(:update, Category.new).must_equal true end
        it "cannot delete categories"   do ability.cannot?(:delete, Category.new).must_equal true end
      end
    end

    describe 'Admin access' do 
      let(:user)    { user_ability(:admin) }
      let(:ability) { Ability.new(user) }
      let(:current_user) { mock 'user' }

      describe 'Posts' do
        it "can index posts"            do ability.can?(:index, :posts).must_equal true end
        it "can show posts"             do ability.can?(:show, Post.new).must_equal true end
        it "can edit posts"             do ability.can?(:edit, Post.new).must_equal true end
        it "can update posts"           do ability.can?(:update, Post.new).must_equal true end
        it "can delete posts"           do ability.can?(:delete, Post.new).must_equal true end
      end

      describe 'Categories' do 
        it "can show categories"        do ability.can?(:show, Category.new).must_equal true end
        it "can edit categories"        do ability.can?(:edit, Category.new).must_equal true end
        it "can update categories"      do ability.can?(:update, Category.new).must_equal true end
        it "can delete categories"      do ability.can?(:delete, Category.new).must_equal true end
      end
    end
  end
end