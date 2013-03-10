class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :topics
  has_many :notifications
  has_one :tag, :class_name => "Topic", :foreign_key => "tag_id"
  has_many :lecture_proposal, :class_name => "Proposal", :foreign_key => "lecture_id"
  has_one :student_proposal, :class_name => "Proposal", :foreign_key => "student_id"
  has_many :student_todo_proposals, :class_name => "TodoProposal", :foreign_key => "student_id"
  has_many :lecture_todo_proposals, :class_name => "TodoProposal", :foreign_key => "lecture_id"
  has_private_messages
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable, :registerable :recoverable,
  devise :database_authenticatable, :registerable, :rememberable, :trackable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :password, :password_confirmation, :remember_me, :keyid, :name, :birthday, :gender, :religion,
                  :avatar, :telephone, :user_type
  
  mount_uploader :avatar, AvatarUploader
  # attr_accessible :title, :body
  
  scope :user_student, lambda{|params| where("(name LIKE ? OR keyid LIKE ?) AND user_type != 'dosen'", "#{params}%","#{params}%")}
  scope :user_lecture, lambda{|params| where("(name LIKE ? OR keyid LIKE ?) AND user_type != 'mahasiswa'", "#{params}%","#{params}%")}

  
  
  def email_required?
    false
  end
  
  protected
  
  def self.included(base)
    base.extend ClassMethods
    assert_validations_api!(base)

    base.class_eval do
      validates_presence_of :email, :if => :email_required?
      validates_uniqueness_of :email, :allow_blank => true, :if => :email_changed?, :scope => [:account]
      validates_format_of :email, :with => email_regexp, :allow_blank => true, :if => :email_changed?
      
      validates_presence_of :password, :if => :password_required?
      validates_confirmation_of :password, :if => :password_required?
      validates_length_of :password, :within => password_length, :allow_blank => true
    end
  end
  
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(keyid) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
  
  def self.lecture_proposal(params)
    where("(name LIKE ? OR keyid LIKE ?) AND user_type = 'dosen'", "#{params}%","#{params}%")
  end
end
