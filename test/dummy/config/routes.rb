Rails.application.routes.draw do

  mount Blog::Engine => "/blog"
  mount Foundationstone::Engine => "/"
end
