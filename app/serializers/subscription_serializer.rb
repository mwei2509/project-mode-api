class SubscriptionSerializer < ActiveModel::Serializer
  attributes :id, :category_name

  def category_name
    object.category.name
  end
end
