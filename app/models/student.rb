class Student < ActiveRecord::Base
  attr_accessor :name, :email
  attr_accessible :name, :email, :password
  belongs_to :user
end
