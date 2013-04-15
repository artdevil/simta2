class AdminAttachment < ActiveRecord::Base
  belongs_to :admin_attachmentable, :polymorphic => true
  attr_accessible :admin_attachmentable_id, :admin_attachmentable_type, :attachment_name
  validates_presence_of :attachment_name
  mount_uploader :attachment_name, AdminAttachmentUploader
end
