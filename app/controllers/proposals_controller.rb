class ProposalsController < ApplicationController
  def new
    @create = params[:create]
    proposal = Proposal.find params[:proposal]
    if params[:create] == "mahasiswa"
      @todo_proposal = current_user.student_proposal.todo_proposals.new(:create_id => current_user.id, :student_id => proposal.student_id, :lecture_id => proposal.lecture_id)
    elsif params[:create] == "dosen"
      @todo_proposal = current_user.lecture_proposal.find(proposal).todo_proposals.new(:create_id => current_user.id, :student_id => proposal.student_id, :lecture_id => proposal.lecture_id)
    end
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
    @todo_proposal = TodoProposal.new(params[:todo_proposal])
    if @todo_proposal.save
      if params[:create] == "mahasiswa"
        notification = create_notification(current_user.id, @todo_proposal.lecture_id, @todo_proposal.id, @todo_proposal.class.name, '1 pesan to dos proposal')
      elsif params[:create] == "dosen"
        notification = create_notification(current_user.id, @todo_proposal.student_id, @todo_proposal.id, @todo_proposal.class.name, '1 pesan to dos proposal')
      end
      if notification
        flash[:success] = "To do proposal telah berhasil di buat.";
        redirect_to root_path
      end
    else
      render 'new', :flash => { :error => "to do gagal di buat." }
    end
  end
  
  def bimbingan_proposal
    @proposal = current_user.lecture_proposal.find(params[:id])
    respond_to do |format|
      format.js
    end
  end
  
  def index
    
  end
  
  def data_mahasiswa
    @user = User.find(params[:proposal][:student])
    respond_to do |format|
      format.js
    end
  end
  
  def update_progress
    @proposal = current_user.lecture_proposal.find_by_student_id(params[:id])
    if @proposal.update_attributes(params[:proposal])
      respond_to do |format|
        format.js
      end
    end
  end
  
  def todo_finish
    @todo_proposal = TodoProposal.find(params[:id])
    if @todo_proposal
      if @todo_proposal.update_attributes(:done => 1)
        respond_to do |format|
          format.js
        end
      end
    end
  end
end
