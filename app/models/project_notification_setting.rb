class ProjectNotificationSetting < ActiveRecord::Base
  unloadable

  include Redmine::SafeAttributes

  belongs_to :project
  safe_attributes 'project_id', 'project_name'

  validates :project_id, uniqueness: true, presence: true
end
