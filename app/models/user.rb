class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :confirmable, :trackable 

  has_one_attached :profile_image
  validates :first_name, :last_name, presence: true
  validates :state, :zip_code, presence: true, on: :update
  validate :date_of_births, on: :update
  
  validates :gender, presence: true, inclusion: { in: %w(male female) }, on: :update


  validates :phone_no, presence: true, format: { with: /\A\(\+234\) \d{3}-\d{3}-\d{4}\z/, message: "Phone number must be in the format (+234) xxx-xxx-xxxx" }, on: :update




  def date_of_births
    if date_of_birth.present? && date_of_birth > 18.years.ago.to_date
      errors.add(:date_of_birth, "You must be at least 18 years of Age")
    end
  end
end
