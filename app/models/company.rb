class Company < ActiveRecord::Base
  has_one :contracts
  attr_accessible :ad_street, :ad_city, :name
end
