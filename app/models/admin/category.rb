class Admin::Category < ApplicationRecord
  has_many :admin_events, class_name: "Admin::Event", foreign_key: "admin_category_id", dependent: :destroy
  validates :name, presence: true, uniqueness: true
  
end
