class Company < ActiveRecord::Base
  belongs_to :contract
  attr_accessible :ad_rue, :ad_ville, :name
end
