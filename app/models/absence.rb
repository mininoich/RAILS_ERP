class Absence < ActiveRecord::Base
  attr_accessible :justificative, :student_id
  belongs_to :student
  has_many :lesson, :dependent => :delete_all #ON DELETE CASCADE
end
