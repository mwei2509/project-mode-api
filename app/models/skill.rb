class Skill < ApplicationRecord
  has_many :qualifications
  has_many :qualified_members, through: :qualifications, source: :account

  has_many :requirements
  has_many :projects, through: :requirements

  validates :name, uniqueness: true, presence: true

  def find_qualified(account)
    begin
      self.qualifications.find_by(account_id: account.id).id
    rescue
      false
    end
  end
end
