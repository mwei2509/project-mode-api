class Like < ApplicationRecord
  belongs_to :project
  belongs_to :account

  validates :project, uniqueness: {scope: :account}
  validates :heart, inclusion: {in: -1..1}
end
