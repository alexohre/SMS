class Admin::Ticket < ApplicationRecord
  belongs_to :admin_event, class_name: 'Admin::Event'
  
  enum ticket_type: ["VIP", "Regular"]
  validates :price, presence: true, numericality: { greater_than: 0 }
  # validates :admin_event_id, presence: true
  # validates :ticket_type, presence: true, inclusion: { in: Admin::Ticket.ticket_types.keys }
  # validates :ticket_type, presence: true
  # validate :validate_seats



  # validates :admin_event_id, presence: true

  # def validate_seats
  #   if vip_seats.blank? && regular_seats.blank?
  #     errors.add(:base, "At least one of VIP seats or Regular seats must be present")
  #   elsif !regular_seats.blank? && !vip_seats.blank?
  #     errors.add(:base, "Only one of VIP seats or Regular seats can have a value")
  #   end
  # end
end
