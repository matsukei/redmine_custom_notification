require_dependency 'project'

module CustomNotification
  module ProjectPatch
    extend ActiveSupport::Concern

    included do
      unloadable

      safe_attributes 'notification_name'
      has_one :notification_setting, autosave: true, class_name: 'ProjectNotificationSetting'

      def notification_name
        notification_setting.try(:project_name)
      end

      def notification_name=(arg)
        record = notification_setting || build_notification_setting
        record.project_name = arg
      end
    end
  end
end

CustomNotification::ProjectPatch.tap do |mod|
  Project.send :include, mod unless Project.include?(mod)
end
