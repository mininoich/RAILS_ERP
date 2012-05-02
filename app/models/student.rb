class Student < ActiveRecord::Base
  attr_accessor :name, :email, :password
  attr_accessible :name, :email, :password
  has_one :user
  has_one :contract
  
  def user_name
    user.name
  end

end
