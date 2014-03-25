module Blog
  class ApplicationController < ::ApplicationController

    # User ability
    def current_ability
      @current_ability ||= Blog::Ability.new current_user
    end
  end
end