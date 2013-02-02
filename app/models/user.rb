class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable, :registerable :recoverable,
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable, :authentication_keys => [:keyid]
  has_private_messages
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
