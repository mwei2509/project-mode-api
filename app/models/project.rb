class Project < ApplicationRecord
  belongs_to :creator, class_name: 'Account', foreign_key: "account_id"

  has_one :flexhelper
  has_many :tags, :dependent => :destroy
  accepts_nested_attributes_for :tags

  has_many :categories, through: :tags

  has_many :requirements, :dependent => :destroy
  accepts_nested_attributes_for :requirements

  has_many :skills, through: :requirements

  has_many :likes

  has_many :comments

  validates :title, presence: true
  validates :description, presence: true

end
