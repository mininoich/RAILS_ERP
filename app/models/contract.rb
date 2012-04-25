class Contract < ActiveRecord::Base
  has_one :company
  has_one :contract_type
  has_one :student
  attr_accessible :date_debut, :date_fin, :company, :contract_type, :student
  
  validates :company, :presence => true
  validates :contract_type, :presence => true
  validates :student, :presence => true
  validates :date_debut, :presence => true
  validates :date_fin, :presence => true
end
