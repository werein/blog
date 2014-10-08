$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'blog/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'blog'
  s.version     = Blog::VERSION
  s.authors     = ['Jiri Kolarik']
  s.email       = ['jiri.kolarik@wereinhq.com']
  s.homepage    = 'http://wereinhq.com'
  s.summary     = 'Blog engine for Rails.'
  s.description = 'Simple mountable Blog engine for Rails'

  s.files       = Dir['{app,config,db,lib}/**/*', 'LICENSE.txt', 'Rakefile', 'README.rdoc']
  s.test_files  = Dir['test/*.*' ,'test/{cells,controllers,data,helpers,integration,models}/**/*','test/dummy/*.*', 'test/dummy/{app,bin,config,db,lib}/**/*']

  s.add_dependency 'rails', '~> 4.0'
  s.add_dependency 'foundationstone', '~> 0.0.3'
  s.add_dependency 'globalize', '~> 4.0.0'
  s.add_dependency 'globalize-missing', '~> 1.0.0' 
  s.add_dependency 'cells'
  s.add_dependency 'friendly_id'
  s.add_dependency 'kaminari'
  s.add_dependency 'ancestry'
  s.add_dependency 'uppr', '~> 1.0'
  s.add_dependency 'simple_form'
  s.add_dependency 'formtastic'
  s.add_dependency 'cocoon'
  s.add_dependency 'nested_form'
  s.add_dependency 'ckeditor'
  s.add_dependency 'disqus'
  s.add_dependency 'enumerize'
  s.add_dependency 'select2-rails'
  s.add_dependency 'kramdown'
  s.add_dependency 'coderay'
  s.add_dependency 'cancancan', '~> 1.9'
end