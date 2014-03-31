require 'kramdown'
require 'coderay'
require 'open-uri'

module Blog
  class Post::Translation < Globalize::ActiveRecord::Translation 
    extend Enumerize
    # include Core::Concerns::Slugged
    validates :title, length: { maximum: 255 }, presence: true
    validates :content_type, presence: true
    validates :locale, presence: true, uniqueness: { scope: :blog_post_id }
    validates :slug, uniqueness: { scope: :locale }

    before_validation :set_slug

    enumerize :locale, in: I18n.available_locales
    enumerize :content_type, in: %w(file remote html)

    mount_uploader :md_file, MarkdownUpploader
    store_in_background :md_file

    def to_s 
      title
    end

    def content
      case content_type
      when 'html'
        html.html_safe
      when 'file', 'remote'
        markdown
      end
    end

    private
      def set_slug
        self.slug = slug? ? slug.try(:parameterize) : to_s.try(:parameterize)
      end

      def markdown
        text = case content_type
        when 'file'
          File.open(md_file.current_path, 'rb') { |f| f.read } if md_file?
        when 'remote'
          open(md_remote).read if md_remote?
        end
        if text
          Kramdown::Document.new(text.force_encoding('UTF-8'), input: 'GFM').to_html
        else
          "Content is currently unreachable"''
        end
      end
  end
end