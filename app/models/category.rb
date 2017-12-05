class Category < ApplicationRecord
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :account

  has_many :tags
  has_many :projects, through: :tags

  validates :name, uniqueness: true, presence: true

  def find_subscription(account)
    begin
      self.subscriptions.find_by(account_id: account.id).id
    rescue
      false
    end
  end
end
