class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :confirmable, :trackable

  enum role: ["super admin", "admin", "auditor" ]

  has_many :user_activity_logs, dependent: :destroy
  before_destroy :delete_associated_logs
  after_save :log_profile_image_upload, if: :profile_image_changed?

  has_one_attached :profile_image
  validates :first_name, :last_name, presence: true
  validates :state, :zip_code, presence: true, on: :update
  validate :date_of_births, on: :update
  validates :address, presence: true, on: :update
  
  validates :gender, presence: true, inclusion: { in: %w(male female) }, on: :update

  validates :phone_no, presence: true, format: { with: /\A\(\+234\) \d{3}-\d{3}-\d{4}\z/, message: " must be in the format (+234) xxx-xxx-xxxx" }, on: :update


  def full_name
    self.first_name.capitalize + " " + self.last_name.capitalize
  end

  private

  def profile_image_changed?
    profile_image.attached? && profile_image.attachment_changes['attachment'].present?
  end

  def log_profile_image_upload
    user_activity_logs.create(description: "Uploaded profile image at #{Time.now}")
  end

  def delete_associated_logs
    user_activity_logs.delete_all
  end

  def date_of_births
    if date_of_birth.present? && date_of_birth > 18.years.ago.to_date
      errors.add(:date_of_birth, "You must be at least 18 years of Age")
    end
  end
end
