class Booking < ActiveRecord::Base

  # Validations
  validates :title, presence: true
  # validates :date, :timeliness => {:on_or_after => lambda { Date.current }}
  validates_date :date, :on_or_after => lambda { Date.current }

  validates :from, presence: true

  validates :to, presence: true

  # Associations
  belongs_to :venue
  belongs_to :user

  # return an active record relation object with the search query in its where clause
  # Return the ActiveRecord::Relation object
  # == Examples
  #   >>> booking.search(query)
  #   => ActiveRecord::Relation object
  scope :search, lambda {|query| where("LOWER(bookings.title) LIKE LOWER('%#{query}%') OR LOWER(bookings.description) LIKE LOWER('%#{query}%')")}
  
end
