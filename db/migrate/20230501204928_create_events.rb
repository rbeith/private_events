class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
			t.belongs_to :creator
      t.string :title
      t.text :description
      t.string :location
      t.datetime :date

      t.timestamps
    end
  end
end
