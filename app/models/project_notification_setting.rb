# coding: utf-8
class ProjectNotificationSetting < ActiveRecord::Base
  unloadable

  include Redmine::SafeAttributes

  belongs_to :project
  safe_attributes 'project_id', 'project_name'

  validates :project_id, uniqueness: true, presence: true

  def replace_subject(subject)
    subject.sub!(project.name, project_name) if project_name.present?

    subject
  end

  class << self

    def replace_headers(global_headers, local_headers)
      # Mailer.headers['X-Redmine-Project'] #=> Mail::Field
      project_identifier = global_headers['X-Redmine-Project'].to_s
      return local_headers if project_identifier.blank?

      project = Project.where(identifier: project_identifier).first
      notification_setting = project.try(:notification_setting)

      if project.present? && notification_setting.present?
        local_headers[:subject] = notification_setting.replace_subject(local_headers[:subject])
      end

      return local_headers
    end

  end
end
