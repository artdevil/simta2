class CreateAdminAttachments < ActiveRecord::Migration
  def change
    create_table :admin_attachments do |t|
      t.string :attachment_name
      t.string :admin_attachmentable_type
      t.integer :admin_attachmentable_id

      t.timestamps
    end
  end
end
