class Room < ActiveRecord::Base
  attr_accessible :name, :nb_places, :nb_computers
  has_many :lesson, :dependent => :delete_all #ON DELETE CASCADE
end