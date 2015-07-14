require 'pathname'

module CustomNotification
  def self.root
    @root ||= Pathname.new File.expand_path('..', File.dirname(__FILE__))
  end
end

# Load patches for Redmine
Rails.configuration.to_prepare do
  Dir[CustomNotification.root.join('app/patches/**/*_patch.rb')].each {|f| require_dependency f }
end

# Load hooks
Dir[CustomNotification.root.join('app/hooks/*_hook.rb')].each {|f| require f }
