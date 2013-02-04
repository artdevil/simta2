class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :topics
  has_many :notifications
  has_one :tag, :class_name => "Topic", :foreign_key => "tag_id"
  has_private_messages
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable, :registerable :recoverable,
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable, :authentication_keys => [:keyid]
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:keyid, :name, :birthday, :gender, :religion,
                  :avatar, :telephone, :user_type
  
  validates :email, :presence => true
  
  mount_uploader :avatar, AvatarUploader
  # attr_accessible :title, :body
  
  scope :user_student, lambda{|params| where("(name LIKE ? OR keyid LIKE ?) AND user_type != 'dosen'", "#{params}%","#{params}%")}
  scope :user_lecture, lambda{|params| where("(name LIKE ? OR keyid LIKE ?) AND user_type != 'mahasiswa'", "#{params}%","#{params}%")}

  protected
  
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(keyid) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
end
