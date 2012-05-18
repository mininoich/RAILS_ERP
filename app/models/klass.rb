class Klass < ActiveRecord::Base
  attr_accessible :name
  has_many :students
  has_many :lessons
end
