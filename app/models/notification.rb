class Notification < ActiveRecord::Base
  belongs_to :sender, :class_name => "User", :foreign_key => "sender_id"
  belongs_to :receiver, :class_name => "User", :foreign_key => "receiver_id"
  belongs_to :status
  belongs_to :notifiable, :polymorphic => true
  attr_accessible :notifiable_type, :notifiable_id, :status_id, :status_description, :receiver_id, :sender_id, :read_at
  scope :notification_read, lambda{|params| where(:receiver_id => params, :read_at => nil)}
  scope :notification_get, lambda{|params| where(:receiver_id => params)}
end
