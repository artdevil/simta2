class Message < ActiveRecord::Base
  is_private_message
  has_ancestry
  has_many :attachments, :as => :attachmentable
  attr_accessible :body, :subject, :recipient, :recipient_id, :sender_id, :attachments_attributes
  # The :to accessor is used by the scaffolding,
  # uncomment it if using it or you can remove it if not
  #attr_accessor :to
  accepts_nested_attributes_for :attachments, :reject_if => proc { |attributes| attributes[:attachment_name].blank? }, allow_destroy: true
end