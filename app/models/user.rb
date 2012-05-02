class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name
  has_many :students, :dependent => :delete_all #ON DELETE CASCADE
  has_many :teachers, :dependent => :delete_all #ON DELETE CASCADE
  has_many :supervisors, :dependent => :delete_all #ON DELETE CASCADE
  has_many :admins, :dependent => :delete_all #ON DELETE CASCADE
end
