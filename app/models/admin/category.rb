class Admin::Category < ApplicationRecord
  has_many :admin_events, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  
end
