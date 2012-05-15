class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |l|
	  l.datetime :date_hour_start
	  l.datetime :date_hour_end
	  l.belongs_to :subject
	  l.belongs_to :room
	  l.belongs_to :klass
	  l.belongs_to :teacher
      l.timestamps
    end
    
    add_index :lessons, :subject_id
    add_index :lessons, :room_id
    add_index :lessons, :klass_id
    add_index :lessons, :teacher_id
  end
end
