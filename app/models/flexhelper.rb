class Flexhelper < ApplicationRecord
  belongs_to :account
  belongs_to :project
  validates :project, uniqueness: { scope: :account }
end
