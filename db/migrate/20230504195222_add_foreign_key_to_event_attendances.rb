class AddForeignKeyToEventAttendances < ActiveRecord::Migration[7.0]
  def change
		change_table :users do |t|
			t.references :attendance, foreign_key: { to_table: :users}
		end
		
		change_table :events do |t|
			t.references :attendee, foreign_key: { to_table: :events}
		end
	end
end