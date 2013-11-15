module Blog
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Migrate database"

      def db_migrate
        rake "db:migrate"
      end   
    end
  end
end