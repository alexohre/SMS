# app/models/transaction.rb
class Transaction < ApplicationRecord
  # Define attributes and validations
  validates :first_name, :last_name, :event_name, :ticket_type, :amount, :phone, presence: true

  def self.statistics
    current_month_range = Time.current.beginning_of_month..Time.current.end_of_month
    current_year_range = Time.current.beginning_of_year..Time.current.end_of_year

    {
      total_amount_current_month: where(created_at: current_month_range).sum(:amount),
      total_amount_current_year: where(created_at: current_year_range).sum(:amount),
      total_ticket_sales_current_month: where(created_at: current_month_range).count
    }
  end

end
