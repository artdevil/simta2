class Message < ActiveRecord::Base
  is_private_message
  has_ancestry
  has_many :attachments, :as => :attachmentable
  has_many :notifications, :as => :notifiable
  
  attr_accessible :body, :subject, :recipient, :recipient_id, :sender_id, :attachments_attributes
  # The :to accessor is used by the scaffolding,
  # uncomment it if using it or you can remove it if not
  #attr_accessor :to
  validates_presence_of :subject, :recipient 
  accepts_nested_attributes_for :attachments, :reject_if => proc { |attributes| attributes[:attachment_name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :notifications, allow_destroy: true
end