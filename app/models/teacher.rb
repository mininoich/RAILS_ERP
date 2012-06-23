class Teacher < ActiveRecord::Base
  attr_accessor :name, :email, :password
  attr_accessible :name, :email, :password
  belongs_to :user
  has_many :abilities, :dependent => :delete_all #ON DELETE CASCADE
  has_many :subjects, :through => :abilities
  has_many :lessons
  has_many :events, :through => :lessons
  def nameTeacher
  	self.user.name
  end
  
end
