class AdminAbility
  include CanCan::Ability

  def initialize(user)
    if user.user_type == "kaprodi"
      can :manage, AdminUser
      can :manage, User
      can :manage, AdminConfig
      can :manage, Document
      can :manage, DocumentCategory
      can :manage, News
    elsif user.user_type == "admin"
      
    end
    can :read, ActiveAdmin::Page, :name => "Dashboard"
  end
end
