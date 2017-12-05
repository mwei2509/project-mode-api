class Comment < ApplicationRecord
  belongs_to :project, touch: true
	belongs_to :commenter, class_name: "Account", foreign_key: "account_id"
	belongs_to :parent, class_name: "Comment", optional: true
	has_many :replies, class_name: "Comment", foreign_key: "parent_id", dependent: :destroy
	delegate :username, to: :commenter
	validates :content, presence: true
end
