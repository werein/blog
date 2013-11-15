Blog::Engine.routes.draw do

  scope '(:locale)', locale: Regexp.new(I18n.available_locales.join("|"))  do
    root to: 'posts#index'      
  end
  localized do 
    resources :posts
    resources :categories, only: [:show, :update]
  end
end
