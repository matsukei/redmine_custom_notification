class CreateProjectNotificationSettings < ActiveRecord::Migration
  def change
    create_table :project_notification_settings do |t|
      t.belongs_to :project
      t.string :project_name

      t.timestamps
    end
    add_index :project_notification_settings, :project_id, unique: true
  end
end
