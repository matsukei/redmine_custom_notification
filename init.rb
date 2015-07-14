Redmine::Plugin.register :redmine_custom_notification do
  name 'Redmine Custom Notification plugin'
  author 'Matsukei Co.,Ltd'
  description 'Redmine plugin for setting notification email subject of project name.'
  version '1.0.0'
  url 'https://github.com/matsukei/redmine_custom_notification'
  author_url 'http://www.matsukei.co.jp/'
end

require_relative 'lib/redmine_custom_notification'
