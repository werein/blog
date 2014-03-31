module Blog
  class Post < ActiveRecord::Base
    translates :slug, :title, :html, :content_type, :md_file, :md_remote, :content
    validates :translations, presence: :true
    accepts_nested_attributes_for :translations, allow_destroy: true
    # include Core::Concerns::Localizable
    
    # Use, when you want to remove id from url
    extend FriendlyId
    friendly_id :title, use: :slugged

    has_and_belongs_to_many :categories
    validates :categories, presence: true

    mount_uploader :image, Uppr::Image
    store_in_background :image

    paginates_per 10

    scope :latest, ->{ order('blog_posts.updated_at DESC') }
    scope :published, ->{ where(published: true) }
    scope :himself, ->(o) { where.not(id: o.id) }

    # def to_param
    #   "#{id} #{translation.slug}".parameterize
    # end
  end
end