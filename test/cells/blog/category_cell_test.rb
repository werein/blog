require 'test_helper'

module Blog
  class CategoryCellTest < Cell::TestCase
    it "should show categories" do 
      category = create(:category)
      render_cell('blog/category', :show).must_include 'Apple iPhone'
    end
  end
end