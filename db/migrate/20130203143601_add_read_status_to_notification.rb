class AddReadStatusToNotification < ActiveRecord::Migration
  def change
    add_column :notifications, :read_at, :date
  end
end
