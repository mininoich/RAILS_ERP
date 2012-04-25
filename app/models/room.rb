class Room < ActiveRecord::Base
  attr_accessible :name, :nb_places, :nb_computers
end