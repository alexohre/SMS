class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :confirmable, :trackable 

  # has_one_attached :profile_image

  validates :phone_no, presence: true, format: { with: /\A\+?\d{3}-\d{3}-\d{4}\z/, message: "Phone number must be in the format (+123) 456-7890" }

end
