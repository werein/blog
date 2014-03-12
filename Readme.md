# Blog

Create posts and categories, nothing more.

## Installation

1. Include gem to the `Gemfile`
```ruby
gem 'blog', '~> 1.0', git: 'git@bitbucket.org:werein/blog.git'
```
2. Mount it like Rails engine
```ruby
mount Blog::Engine => '/blog'
```
3. Install engine
```
rails g blog:install
```

## Layout

Engine provide bootstrap layout for blog. Just load them in your `application.css.sass`

```scss
@import blog/app
```

## Components

Are parts of application. They can be rendered whatever you want. On each component can specified view. There are list of components and views.

###### Example

```haml
render_cell 'blog/category', :show
```

### Category

* **show** - find roots categories
* **by_name** - find category by friendly name (slug)

** Views **

* **tree** - Show tree of categories, can be used for `show`

### Posts

* **show** - show latest posts, take `:limit` as argument
* **related** - show related categories by given `:post`
