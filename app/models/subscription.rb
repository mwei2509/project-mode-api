class Subscription < ApplicationRecord
  belongs_to :account
  belongs_to :category, touch: true
  validates :category, uniqueness: { scope: :account }
end
