class ProposalsController < ApplicationController
  def new
    @create = params[:create]
    proposal = Proposal.find params[:proposal]
    @todo_proposal = current_user.student_proposal.todo_proposals.new(:create_id => current_user.id, :student_id => proposal.student_id, :lecture_id => proposal.lecture_id)
  end
  
  def todo
    @todo_proposal = TodoProposal.find(params[:id])
  end
  
  def comment
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id
    if @comment.save
      respond_to do |format|
        format.html { redirect_to @comment.commentable, :flash => {:success => "komentar berhasil dimasukkan"} }
        format.js
      end
    end
  end
  
  def create
    @todo_proposal = current_user.student_proposal.todo_proposals.new(params[:todo_proposal])
    if @todo_proposal.save
      if params[:create] == "mahasiswa"
        notification = create_notification(current_user.id, @todo_proposal.lecture_id, @todo_proposal.id, @todo_proposal.class.name, Status.find(1).id, '1 pesan to dos proposal')
      elsif params[:create] == "dosen"
        notification = create_notification(current_user.id, @todo_proposal.student_id, @todo_proposal.id, @todo_proposal.class.name, Status.find(1).id, '1 pesan to dos proposal')
      end
      if notification
        flash[:success] = "To do proposal telah berhasil di buat.";
        redirect_to root_path
      end
    else
      render 'new', :flash => { :error => "to do gagal di buat." }
    end
  end
end
