require 'foundationstone'
require 'auth'
require 'globalize'
require 'globalize/missing'
require 'friendly_id'
require 'kaminari'
require 'ancestry'
require 'cells'
require 'uppr'
require 'simple_form'
require 'nested_form'
require 'formtastic'
require 'cocoon'
require 'ckeditor'
require 'ckeditor/outsourced'
require 'disqus'
require 'enumerize'
require 'route_translator'
require 'select2-rails'

module Blog
  class Engine < ::Rails::Engine
    isolate_namespace Blog

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths['db/migrate'].expanded.each do |expanded_path|
          app.config.paths['db/migrate'] << expanded_path
        end
      end
    end
  end
end
