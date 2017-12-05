class LikeSerializer < ActiveModel::Serializer
  attributes :id, :heart, :liked_by

  def liked_by
    {
      id: object.account.id,
      username: object.account.username
    }
  end
end
