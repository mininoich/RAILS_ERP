class Company < ActiveRecord::Base
  has_one :contracts
  attr_accessible :ad_rue, :ad_ville, :name
end
