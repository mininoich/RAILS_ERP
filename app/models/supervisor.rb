class Supervisor < ActiveRecord::Base
  attr_accessor :name, :email, :password
  attr_accessible :name, :email, :password, :klass_id
  belongs_to :user
end
