class Teacher < ActiveRecord::Base
  attr_accessor :name, :email
  attr_accessible :name, :email, :password
  belongs_to :user
  has_many :abilities
  has_many :subjects, :through => :abilities
end
