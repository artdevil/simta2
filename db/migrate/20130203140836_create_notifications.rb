class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :notifiable_id
      t.string :notifiable_type
      t.integer :status_id
      t.string :status_description

      t.timestamps
    end
  end
end
