class TopicStatus < ActiveRecord::Base
  has_many :notifications
  has_many :topic
  attr_accessible :description
end
