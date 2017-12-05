class TagSerializer < ActiveModel::Serializer
  attributes :id, :category_name
  belongs_to :category
  belongs_to :project

  def category_name
    object.category.name
  end
end
