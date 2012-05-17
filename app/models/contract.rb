class Contract < ActiveRecord::Base
  attr_accessible :date_debut, :date_fin, :student_id, :company_id, :contract_type_id
  belongs_to :company
  belongs_to :contract_type
  belongs_to :student
  
  attr_accessible :date_hour_start, :date_hour_end, :subject_id, :room_id, :klass_id, :teacher_id
  belongs_to :subject
  belongs_to :room
  belongs_to :klass
  belongs_to :teacher
  has_many :evaluation, :dependent => :delete_all #ON DELETE CASCADE  
end
