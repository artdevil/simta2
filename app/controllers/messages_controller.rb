class MessagesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @message = Message.new
  end
  
  def user
    if current_user.user_type == "mahasiswa"
      @user = User.user_lecture params[:term]
    elsif current_user.user_type == "dosen"
      @user = User.user_student params[:term]
    end
    render json: @user.map(&:name)
  end
  
  def create
    params["message"]["recipient"] = User.find_by_name(params["message"]["recipient"])
    @message = Message.new params["message"]
    @message.sender = current_user
    if @message.save
      notification = create_notification(@message.sender_id, @message.recipient_id, @message.id, @message.class.name, Status.find(1).id, '1 pesan private messages')
      if notification
        flash[:success] = "Pesan telah terkirim.";
        redirect_to messages_path
      end
    else
      redirect_to messages_path, :flash => { :error => "pesan gagal dikirim." }
    end
  end
  
  def show
    @message = Message.read_message(params[:id], current_user)
    @status = params[:status]
    respond_to do |format|
      format.js
    end
  end
  
  def reply
    message = Message.find(params[:id])
    @message = Message.new
    @message.recipient = User.find(message.sender.id)
    @message.subject = "re : #{message.subject}"
    respond_to do |format|
      format.js
    end
  end
  
  def destroy
    @status = params[:status]
    if @status == "inbox"
      @message = current_user.received_messages.find(params[:id])
    elsif @status == "outbox"
      @message = current_user.sent_messages.find(params[:id])
    end
    
    if @message.mark_deleted(current_user)
      respond_to do |format|
        format.js
      end
    end
  end
end
