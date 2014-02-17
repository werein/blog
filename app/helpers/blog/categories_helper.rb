module Blog
  module CategoriesHelper

    def blog_category_tree_with_posts engine_name, items, options = {}
      content_tag :ul do
        items.map do |item|
          output = '<li>'
          klass = ( item.children.find{|i| current_page?(polymorphic_path([engine_name, i])) } ? 'active' : nil ) if item.has_children?
          klass = current_page?(polymorphic_path([engine_name, item])) ? 'current' : klass
          output << link_to(item.send(options.fetch(:title, 'title')), polymorphic_path([engine_name, item]), class: klass)
          output << blog_category_tree_with_posts(engine_name, item.children, options) if item.has_children?
          output << content_tag(:ul) do
            item.posts.map do |post|
              content_tag(:li, class: 'post') { link_to(post.title, blog.post_path(post)) }
            end.join.html_safe
          end if item.posts
          output << '</li>'
          output
        end.join.html_safe
      end
    end
  end
end
