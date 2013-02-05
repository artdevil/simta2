class TopicsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  def index
    @tab = "2"
    @topics = Topic.page(params[:page]).per(10)
  end

  def show
    @tab = "2"
    @topic = Topic.find(params[:id])
  end

  def new
    @tab = "2"
    @topic = Topic.new
  end

  def create
    @topic = Topic.new params[:topic]
    @topic.user_id = current_user.id
    if @topic.save
      flash[:success] = "topik berhasil di inputkan";
      redirect_to @topic
    else
      render 'new'
    end
  end

  def edit
    @tab = "2"
    @topic = Topic.find(params[:id])
  end
  
  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(params[:topic])
      flash[:success] = "topik berhasil di update";
      redirect_to @topic
    else
      render 'edit'
    end
  end
  
  def tag_topic
    @topic = Topic.find(params[:id])
    if @topic.update_column(:tag_id, current_user.id)
      notification = create_notification(@topic.tag_id, @topic.user_id, @topic.id, @topic.class.name, Status.find(2).id, '1 pesan permintaan persetujuan topik TA')
      if notification
        flash[:success] = "topik berhasil di ambil. Menunggu konfirmasi dari dosen"
        redirect_to root_path
      end
    else
      redirect_to @topic, :flash => { :error => "topic tidak bisa diambil." }
    end
  end
  
  def approve
    @topic = current_user.topics.find(params[:id])
    if @topic.update_attributes(:confirmation => "true", :status_id => 3)
      proposal = Proposal.new(:student_id => @topic.tag_id, :lecture_id => @topic.user_id, :topic_id => @topic.id)
      if proposal.save
        notification = create_notification(@topic.user_id,@topic.tag_id, @topic.id, @topic.class.name, Status.find(3).id, 'Permintaan TA anda disetujui silahkan upload proposal')
        if notification
           respond_to do |format|
              format.js
            end
        end
      end
    end
  end
  
end
