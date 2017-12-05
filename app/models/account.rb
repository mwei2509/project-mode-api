class Account < ApplicationRecord
  has_secure_password

  has_many :flexhelpers
  has_many :projects #user created projects
  # has_many :messages, through: :projects, class_name: "Comment"
  has_many :comments

  has_many :subscriptions, :dependent => :destroy
  has_many :interests, through: :subscriptions, source: :category
  has_many :newsfeed_projects, through: :interests, source: :projects

  has_many :qualifications, :dependent => :destroy
  has_many :skills, through: :qualifications
  has_many :qualified_projects, through: :skills, source: :projects

  has_many :likes

  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true

  def self.authenticate(identifier, password)
    username = Account.find_by(username: identifier)
    username.authenticate(password) if username
    email = Account.find_by(email: identifier)
    email.authenticate(password) if email
    (username && username.authenticate(password)) || (email && email.authenticate(password))
  end

end
