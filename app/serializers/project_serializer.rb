class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :creator_id, :creator_name, :total_likes, :created_at, :total_comments, :last_updated, :latest_comment

  has_many :likes
  has_one :flexhelper
  has_many :categories, through: :tags
  has_many :skills, through: :requirements
  has_many :comments

  def creator_name
    object.creator.username
  end

  def creator_id
    object.creator.id
  end

  def total_likes
    object.likes.sum(:heart)
  end

  def total_comments
    object.comments.length
  end

  def comments
    object.comments.where(parent_id: nil)
  end

  def last_updated
    object.updated_at
  end

  def latest_comment
    comments.order(updated_at: :desc).limit(1)
  end
end
