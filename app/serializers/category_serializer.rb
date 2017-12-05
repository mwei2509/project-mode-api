class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :num_subscribers
  # has_many :subscribers, through: :subscriptions, source: :account

  def num_subscribers
    object.subscribers.count
  end
end
