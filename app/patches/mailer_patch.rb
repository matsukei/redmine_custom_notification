require_dependency 'mailer'

module CustomNotification
  module MailerPatch
    extend ActiveSupport::Concern

    included do
      unloadable

      alias_method :mail_without_custom_notification, :mail

      def mail(local_headers = {}, &block)
        local_headers = ProjectNotificationSetting.replace_headers(self.headers, local_headers)
        mail_without_custom_notification(local_headers, &block)
      end
    end

  end
end

Mailer.send :include, CustomNotification::MailerPatch
