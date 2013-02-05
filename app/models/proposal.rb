class Proposal < ActiveRecord::Base
  has_many :proposal_files
  belongs_to :lecture, :class_name => "User", :foreign_key => "lecture_id"
  belongs_to :student, :class_name => "User", :foreign_key => "student_id"
  belongs_to :topic
  attr_accessible :lecture_id, :progress, :student_id, :topic_id
end
