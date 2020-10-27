class Transaction < ApplicationRecord
  belongs_to :account
  validates :category, inclusion: { in: %w(
    entertainment
    household
    apparel
    utilities
    transportation
    food
  ), message: "Must be one of the following categories: Entertainment, Household, Apparel, Utilities, Transportation, Food"}
end
