module Blog
  class Post::Translation < Globalize::ActiveRecord::Translation 
    extend Enumerize
    validates :title, length: { maximum: 255 }, presence: true
    validates :content, presence: true
    validates :locale, presence: true, uniqueness: { scope: :blog_post_id }
    validates :slug, uniqueness: { scope: :locale }

    before_validation :set_slug

    enumerize :locale, in: I18n.available_locales

    def to_s; title; end

    private
      def set_slug
        self.slug = slug? ? slug.try(:parameterize) : title.try(:parameterize)
      end
  end
end