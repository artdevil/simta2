module ApplicationHelper
  def notification_read
    notification = Notification.notification_read(current_user.id).length
    return notification
  end
  
  def notification_get
    notification = Notification.notification_get(current_user.id)
    return notification
  end
  
  def find_topic_user
    topic = Topic.where(:tag_id => current_user.id)
    if topic.length > 0
      return true
    else
      return false
    end
  end
  
  def label_create topic
    status = topic.status_id
    if status == 1
      class_status = "label label-success"
    elsif status == 2 or status == 3
      class_status = "label label-important"
    end
    return content_tag(:span, topic.status.name, :class => class_status)
  end
end
