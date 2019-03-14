class Passenger < ApplicationRecord

  after_create :new_passenger_email_send

  def new_passenger_email_send 
    PassengerMailer.new_passenger_email(self).deliver_now
  end

  belongs_to :passenger, class_name: "User"
  belongs_to :carsharing

  validates :stripe_customer_id, 
  presence: true

end
