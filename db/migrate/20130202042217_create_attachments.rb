class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :attachment_name
      t.integer :attachmentable_id
      t.string :attachmentable_type

      t.timestamps
    end
  end
end
