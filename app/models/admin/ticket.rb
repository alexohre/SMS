class Admin::Ticket < ApplicationRecord
  belongs_to :admin_event, class_name: 'Admin::Event', foreign_key: 'admin_event_id'

  enum ticket_type: ["VIP", "Regular"]
  validates :ticket_type, presence: true
  validate :validate_seats
  validates :price, presence: true, numericality: { greater_than: 0 }




  def validate_seats
    if vip_seats.blank? && regular_seats.blank?
      errors.add(:base, "At least one of VIP seats or Regular seats must be present")
    elsif !regular_seats.blank? && !vip_seats.blank?
      errors.add(:base, "Only one of VIP seats or Regular seats can have a value")
    end
  end
end
