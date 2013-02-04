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
    
  end
end
