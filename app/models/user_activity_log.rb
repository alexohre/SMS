class UserActivityLog < ApplicationRecord
  belongs_to :user

  attribute :action, :string
end
