module Blog
  class CategoryCell < Cell::Rails
    include CanCan::ControllerAdditions
    include Core::ApplicationHelper
    helper Core::ApplicationHelper
    append_view_path 'app/views'

    def show args = {}
      @categories = Blog::Category.roots.with_translations(I18n.locale)
      args[:view] ? render(view: args[:view]) : render unless @categories.empty?
    end
  end
end