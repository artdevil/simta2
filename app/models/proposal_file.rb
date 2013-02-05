class ProposalFile < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :student_proposal_file, :class_name => "User", :foreign_key => "student_id"
  attr_accessible :student_id,:file, :note, :proposal_id, :title
  mount_uploader :file, FileProposalUploader
end
