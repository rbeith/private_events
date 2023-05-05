class CreateEventAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :event_attendances do |t|
			t.belongs_to :attended_event
			t.belongs_to :attendee
      t.timestamps
    end
  end
end
