class AccountSerializer < ActiveModel::Serializer
  attributes :id, :email, :username

  has_many :interests, through: :subscriptions, source: :category
  has_many :skills, through: :qualifications, source: :skills

  has_many :projects
  has_many :newsfeed_projects, through: :interests, source: :projects
  has_many :qualified_projects, through: :skills, source: :projects

  # def newsfeed_projects
  #   object.newsfeed_projects.map do |proj|
  #     ProjectSerializer.new(proj)
  #   end
  # end
end
