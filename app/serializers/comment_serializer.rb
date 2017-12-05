class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :parent_id, :username, :replies, :created_at

  def replies
    Comment.where(parent_id: object.id).map do |comment|
      CommentSerializer.new(comment)
    end
  end
end
