class Document < ActiveRecord::Base
  belongs_to :document_category
  has_many :admin_attachments, :as => :admin_attachmentable
  attr_accessible :document_category_id, :title, :admin_attachments_attributes
  accepts_nested_attributes_for :admin_attachments, :reject_if => proc { |attributes| attributes[:attachment_name].blank? }, allow_destroy: true
end
