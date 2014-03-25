module Blog
  class CategoryCell < Cell::Rails
    # include CanCan::ControllerAdditions
    # include Core::ApplicationHelper
    # helper Core::ApplicationHelper
    # helper CategoriesHelper
    # append_view_path 'app/views'

    def show args = {}
      @categories = Blog::Category.roots.with_translations(I18n.locale)
      args[:view] ? render(view: args[:view]) : render unless @categories.empty?
    end

    def by_name name, args = {}
      @category = Blog::Category.with_translations(I18n.locale).friendly.find(name)
      args[:view] ? render(view: args[:view]) : render if @category
    end
  end
end