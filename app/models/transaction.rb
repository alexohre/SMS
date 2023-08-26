# app/models/transaction.rb
class Transaction < ApplicationRecord
  # Define attributes and validations
  validates :first_name, :last_name, :event_name, :ticket_type, :amount, :phone, presence: true
end
