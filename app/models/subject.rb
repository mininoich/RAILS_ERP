class Subject < ActiveRecord::Base
  attr_accessible :name
  has_many :abilities
  has_many :teachers, :through => :abilities
end
