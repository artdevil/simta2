class TopicsController < ApplicationController
  def index
    @topics = Topic.page(params[:page]).per(10)
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
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
end
