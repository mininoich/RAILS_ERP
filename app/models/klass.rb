class Klass < ActiveRecord::Base
  attr_accessible :name
  has_many :students
  has_many :lessons
  has_many :events, :through => :lessons
end
