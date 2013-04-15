class DocumentCategory < ActiveRecord::Base
  has_many :document
  attr_accessible :name
end
