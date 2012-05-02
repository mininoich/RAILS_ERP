class Contract < ActiveRecord::Base
  belongs_to :company
  belongs_to :contract_type
  belongs_to :student
  attr_accessible :date_debut, :date_fin, :company_id, :contract_type_id, :student_id
  
  validates :company, :presence => true
  validates :contract_type, :presence => true
  validates :student, :presence => true
  validates :date_debut, :presence => true
  validates :date_fin, :presence => true
end
