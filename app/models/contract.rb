class Contract < ActiveRecord::Base
  attr_accessible :date_debut, :date_fin, :company, :contract_type, :student
  belongs_to :company
  belongs_to :contract_type
  belongs_to :student
end
