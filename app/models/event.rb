class Event < ActiveRecord::Base
  attr_accessible :name, :start_at, :end_at
  has_event_calendar
  belongs_to :lesson
end
