# Blog

Create posts and categories, nothing more.

## Installation

1. Include gem to the `Gemfile`
```ruby
gem 'blog', git: 'git@bitbucket.org:werein/blog.git'
```
2. Mount it like Rails engine
```ruby
mount Blog::Engine => '/blog'
```
3. Install engine
```
rails g blog:install
```

## Configuration

You need to specify `User` class with `has_role?` method. It determinate if user have access to given action.

Create `config/initializers/blog.rb` file with following:

```ruby
Blog.user_class = 'User'
```

or dummy user class

```ruby
Blog.user_class = 'Tuberack::DummyUser'
```

## Abilities

Blog has some default abilities

### Unauthorized user, user

* show posts, post, category
* nothing else

### Admin

* everything

## Attributes

On every model can be set different attributes.

### Post

* active - if post isn't active, than can't be accessed by user
* image - post ilustration
* categories - can be sorted into multiple categories
* translations - have multiple translations
	* title - post title
	* locale - post language
	* slug - text in url
	* content type - determinate if is used HTML or Markdown file / Remote md file
	* file - uploader for markdown file, which will be parsed into html
	* remote - link to remote makrdown file, wich will be parsed into html
	* html - input HTML directly, **ckeditor** is used as default WYSIWYG

### Category

* parent - tree structure of category
* translations - have multiple translation
	* title - name of translation
	* locale - language of category
	* description - category description

## Front-end

Engine provide bootstrap styled view and javascript functions for blog. Just load them in your `application.css.sass` and `application.js.coffee`. Plese check `requirements.sass/coffee` for libraries used in blog engine.

```sass
@import blog/app
```

```coffee
#= require blog/app
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
