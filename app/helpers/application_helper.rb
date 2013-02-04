module ApplicationHelper
  def notification_read
    notification = Notification.notification_read(current_user.id).length
    return notification
  end
  
  def notification_get
    notification = Notification.notification_get(current_user.id)
    return notification
  end
end
