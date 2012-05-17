class ContractType < ActiveRecord::Base
  has_one :contracts
  attr_accessible :libelle
end
