require 'blog/engine'

module Blog
  def self.user_class
    @@user_class.constantize
  end
end
