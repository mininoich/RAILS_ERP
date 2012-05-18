class Ability < ActiveRecord::Base
  attr_accessible :subject_id, :teacher_id
  belongs_to :teacher
  belongs_to :subject
end
