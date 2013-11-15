module Blog
  class Post < ActiveRecord::Base
    translates :slug, :title, :content
    include Core::Concerns::Localizable

    extend FriendlyId
    friendly_id :title, use: :slugged

    has_and_belongs_to_many :categories
    validates :categories, presence: true

    mount_uploader :image, Uploadable::ImageUploader
    store_in_background :image

    paginates_per 10

    scope :latest, ->{ order('blog_posts.updated_at DESC') }
    scope :published, ->{ where(published: true) }
    scope :himself, ->(o) { where.not(id: o.id) }
  end
end