class Qualification < ApplicationRecord
  belongs_to :account
  belongs_to :skill, touch: true
  validates :skill, uniqueness: { scope: :account }
end
