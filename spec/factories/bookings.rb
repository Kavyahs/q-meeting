FactoryGirl.define do
  factory :booking do
    title "Sprint Planning Meeting"
    description "For the project XYZ"
    date Date.today()
    from {Time.now + 300.minutes}
    to {Time.now + 360.minutes}
    user
    venue
  end
end
