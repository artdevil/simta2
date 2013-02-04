class NotificationsController < ApplicationController
  before_filter :authenticate_user!
  
  def getnotification
    @notifications = Notification.notification_get(current_user.id).order("created_at DESC").limit(5)
    respond_to do |format|
      format.js
    end
  end
  
  def index
    
  end
  
  def getnumber
    
  end
  
  def show
    
  end
end
