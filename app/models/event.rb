class Event < ApplicationRecord
  belongs_to :category, class_name: "Category"
  
  has_many :tickets, class_name: "Ticket", foreign_key: "event_id"
  
  validates :category_id, presence: true
  has_one_attached :photo
  validates :name, presence: true, length: {maximum: 60}
  validates :description, presence: true
  validates :photo, presence: true
  validates :start_date, presence: true
  validates :start_time, presence: true
  validates :duration, presence: true

  enum duration: ["1 Hour", "1H 30 Min", "2 Hours", "2H 30 Min", "3 Hours", "4 Hours", "6 Hours", "12 hours", "1 Day"]
  
  scope :upcoming, -> { where('start_date >= ?', Date.current).order(start_date: :asc) }
  scope :past, -> { where('start_date < ?', Date.current).order(start_date: :desc) }

end
