RailsAdmin.config do |config|
  config.model Blog::Post do
    navigation_icon 'icon-list-alt'
    field :image
    field :translations
    field :categories
    list do
      field :title
      field :image
      field :created_at do
        column_width 200
      end
    end
  end
  config.model Blog::Post::Translation do
    visible false
    field :title
    field :slug
    field :locale
    field :content, :ck_editor
  end

  config.model Blog::Category do
    navigation_icon 'icon-list'
    field :parent_id, :enum do
      enum_method do
        :parent_enum
      end
    end
    field :image
    field :translations
    list do
      field :title
      field :image
      field :created_at do
        column_width 200
      end
    end
  end
  config.model Blog::Category::Translation do
    visible false
    field :title
    field :slug
    field :locale
    field :content, :ck_editor
  end

end if defined? RailsAdmin