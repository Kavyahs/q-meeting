class Venue < ActiveRecord::Base

  # Validations
  validates :name, presence: true

  # Associations
  has_many :bookings

  # return an active record relation object with the search query in its where clause
  # Return the ActiveRecord::Relation object
  # == Examples
  #   >>> booking.search(query)
  #   => ActiveRecord::Relation object
  scope :search, lambda {|query| where("LOWER(venues.name) LIKE LOWER('%#{query}%')")}

end
