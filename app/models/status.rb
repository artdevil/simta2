class Status < ActiveRecord::Base
  has_many :notifications
  attr_accessible :name, :other
end
