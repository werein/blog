module Blog
  class PostCell < Cell::Rails
    include CanCan::ControllerAdditions
    include Core::ApplicationHelper
    helper Core::ApplicationHelper
    append_view_path 'app/views'

    def show args = {}
      @posts = Blog::Post.with_translations(I18n.locale).order(args[:order] || 'blog_posts.created_at ASC').limit(args[:limit] || 10)
      args[:view] ? render(view: args[:view]) : render unless @posts.empty?
    end

    def related args = {}
      post = args[:post]
      @related_posts = Blog::Category.find(post.categories.first).posts.with_translations(I18n.locale).himself(post).limit(args[:limit] || 10)
      args[:view] ? render(view: args[:view]) : render unless @related_posts.empty?
    end
  end
end