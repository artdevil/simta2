class RemoveStatusIdForNotifications < ActiveRecord::Migration
  def up
  	remove_column :notifications, :status_id
  end

  def down
  end
end
