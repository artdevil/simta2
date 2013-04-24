class PagesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @tab = "1"
    page = params[:page]
    @news = News.page(params[:page]).per(5)
  end
  
  def user_profile
    @user = User.find(params[:id])
  end
  
  def news
    @news = News.page(params[:page]).per(5)
  end
  
  def wiki
    @tab = "3"
    @document_categories = DocumentCategory.all
  end
end
