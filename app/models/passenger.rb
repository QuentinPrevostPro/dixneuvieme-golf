class Passenger < ApplicationRecord

  after_create :new_passenger_email_send
  after_create :new_reservation_passenger_email_send
  after_create :carsharing_review_email_send

  def new_passenger_email_send 
    PassengerMailer.new_passenger_email(self).deliver_now
  end

  def new_reservation_passenger_email_send 
    PassengerMailer.new_reservation_passenger_email(self).deliver_now
  end

  def carsharing_review_email_send
    PassengerMailer.carsharing_review_email(self).deliver_later(wait: (Carsharing.find(Passenger.last.carsharing_id).date - DateTime.now+10*3600).seconds)
  end

  belongs_to :passenger, class_name: "User"
  belongs_to :carsharing

  validates :stripe_customer_id, 
  presence: true

end
