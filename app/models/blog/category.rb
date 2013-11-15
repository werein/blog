module Blog
  class Category < ActiveRecord::Base
    translates :slug, :title, :content
    include Core::Concerns::Localizable

    extend FriendlyId
    friendly_id :title, use: :slugged
    
    has_and_belongs_to_many :posts
    
    has_ancestry

    mount_uploader :image, Uploadable::ImageUploader
    store_in_background :image

    scope :himself, ->(o) { where.not(id: o.id) }

    def parent_enum
      Category.himself(self).map { |c| [ c.title, c.id ] }
    end
  end
end