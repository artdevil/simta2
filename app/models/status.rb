class Status < ActiveRecord::Base
  has_many :notifications
  has_many :topic
  attr_accessible :name, :other
end
