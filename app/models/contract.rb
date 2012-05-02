class Contract < ActiveRecord::Base
  has_one :company
  has_one :contract_type
  has_one :student
  attr_accessible :date_debut, :date_fin, :company_id, :contract_type_id, :student_id
end
