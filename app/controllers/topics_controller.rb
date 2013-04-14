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
    if !params[:topic][:proposal_attributes][:student_id].blank?
      user = user_find(params[:topic][:proposal_attributes][:student_id])
      if user
        params[:topic][:proposal_attributes][:student_id] = user.first.id
        params[:topic][:proposal_attributes][:lecture_id] = current_user.id
        params[:topic][:confirmation] = true
        params[:topic][:status_id] = 3
        params[:topic][:tag_id] = user.first.id
        user.first.update_attributes(:user_status_id => 3)
      else
        
      end
    end
    @topic = Topic.new params[:topic]
    @topic.lecture_id = current_user.id
    if @topic.save
      flash[:success] = I18n.t('topic.create.success')
      redirect_to @topic
    else
      flash[:error] = I18n.t('topic.create.error')
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
      flash[:success] = "topik berhasil di update"
      redirect_to @topic
    else
      render 'edit'
    end
  end
  
  def tag_topic
    @topic = Topic.find(params[:id])
    if check_quote_proposal(@topic.lecture_topic)
      if @topic.update_attributes(:tag_id => current_user.id, :topic_status_id => 2)
        notification = create_notification(@topic.tag_id, @topic.lecture_id, @topic.id, @topic.class.name, I18n.t('topic.tag_topic.notification'))
        if notification
          current_user.update_column("user_status_id",2)
          flash[:success] = I18n.t('topic.tag_topic.success')
          redirect_to root_path
        end
      else
        redirect_to @topic, :flash => { :error => I18n.t('topic.tag_topic.error') }
      end
    else
      redirect_to @topic, :flash => { :error => I18n.t('default.limit_quote_proposal') }
    end
  end
  
  def approve
    @topic = current_user.topics.find(params[:id])
    if @topic.update_attributes(:confirmation => true, :topic_status_id => 3)
      proposal = Proposal.new(:student_id => @topic.tag_id, :lecture_id => @topic.lecture_id, :topic_id => @topic.id)
      if proposal.save
        notification = create_notification(@topic.lecture_id,@topic.tag_id, @topic.id, @topic.class.name, 'Permintaan TA anda disetujui silahkan upload proposal')
        if notification
           respond_to do |format|
              format.js
            end
        end
      end
    end
  end
  
  def user
    @user = User.user_topic params[:term]
    render json: @user.map(&:name)
  end
  
end
