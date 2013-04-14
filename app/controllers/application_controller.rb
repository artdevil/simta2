class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
  def after_sign_in_path_for(resource)
    case resource
      when User
        root_path
      when AdminUser
        admin_dashboard_path
      end
  end
  
  def current_ability
    @current_ability ||= case
                           when current_user
                             Ability.new(current_user)
                           when current_admin_user
                             AdminAbility.new(current_admin_user)
                           end
    # @current_ability ||= Ability.new(current_user)
  end
  
  def create_notification sender_id, receiver_id, notifiable_id, notifiable_type, status_description
    notification = Notification.new(:sender_id => sender_id, :receiver_id => receiver_id, :notifiable_id => notifiable_id, :notifiable_type => notifiable_type, :status_description => status_description)
    if notification.save
      return true
    else
      return false
    end
  end
  
  def user_find(param)
    if current_user.user_type == "mahasiswa"
      user = User.user_lecture param
    elsif current_user.user_type == "dosen"
      user = User.user_student param
    end
    
    return user
  end
  
  def check_quote_proposal lecture
    proposal = Proposal.where("lecture_id = '#{lecture.id}' or assistant_id = '#{lecture.id}' and done = '0'")
#     if proposal.length < lecture.limit_proposal.to_i
#       return true
#     else
#       return false
#     end
    return proposal.length < lecture.limit_proposal.to_i
  end
  
end
