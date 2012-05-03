class Contract < ActiveRecord::Base
  belongs_to :company
  belongs_to :contract_type
  belongs_to :student
  attr_accessible :date_debut, :date_fin, :company, :contract_type, :student
end
