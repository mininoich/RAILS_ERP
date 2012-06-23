class AddLessonIdToEvent < ActiveRecord::Migration
  def change
        add_column :events, :lesson_id, :integer
        add_index :events, :lesson_id
  end
end
