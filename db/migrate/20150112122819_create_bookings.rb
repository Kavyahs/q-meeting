class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :title
      t.text :description
      t.date :date
      t.time :from
      t.time :to
      t.references :user, index: true
      t.references :venue, index: true
      t.timestamps
    end
  end
end
