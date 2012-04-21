class Subject < ActiveRecord::Base
  attr_accessible :name
  has_many :abilities, :dependent => :delete_all #ON DELETE CASCADE
  has_many :teachers, :through => :abilities
end
