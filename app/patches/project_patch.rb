require_dependency 'project'

module CustomNotification
  module ProjectPatch
    unloadable

    extend ActiveSupport::Concern

    included do
      unloadable

      safe_attributes 'notification_setting_attributes'

      has_one :notification_setting, dependent: :destroy, class_name: 'ProjectNotificationSetting'
      accepts_nested_attributes_for :notification_setting
    end

  end
end

Project.send :include, CustomNotification::ProjectPatch
