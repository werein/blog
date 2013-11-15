Rails.application.routes.draw do

  mount Blog::Engine => "/blog"
  mount Auth::Engine => "/auth"
  mount Core::Engine => "/"
end
