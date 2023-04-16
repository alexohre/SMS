class Admin::Event < ApplicationRecord
  belongs_to :admin_category, class_name: "Admin::Category"
  
  has_many :admin_tickets, class_name: "Admin::Ticket", foreign_key: "admin_event_id"
  
  validates :admin_category_id, presence: true
  has_one_attached :photo
  validates :name, presence: true, uniqueness: true, length: {maximum: 60}
  validates :description, presence: true
  validates :photo, presence: true
  validates :start_date, presence: true
  validates :start_time, presence: true

  enum duration: ["1 Hour", "1H 30 Min", "2 Hours", "2H 30 Min", "3 Hours", "4 Hours", "6 Hours", "12 hours", "1 Day"]
  
end
