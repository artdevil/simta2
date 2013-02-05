class ProposalsController < ApplicationController
  def new
    @proposal_file = current_user.student_proposal.proposal_files.new(:student_id => current_user.id)
  end
end
