class Booking < ActiveRecord::Base

  # Validations
  validates :title, presence: true

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
