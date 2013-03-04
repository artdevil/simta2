class Proposal < ActiveRecord::Base
  has_many :todo_proposals
  belongs_to :lecture, :class_name => "User", :foreign_key => "lecture_id"
  belongs_to :assistant, :class_name => "User", :foreign_key => "assistant_id"
  belongs_to :student, :class_name => "User", :foreign_key => "student_id"
  belongs_to :topic
  attr_accessible :lecture_id, :progress, :student_id, :topic_id, :assistant_id

  def self.lecture_proposal
    where("(name LIKE ? OR keyid LIKE ?) AND user_type = 'dosen'", "#{params}%","#{params}%")
  end
end
