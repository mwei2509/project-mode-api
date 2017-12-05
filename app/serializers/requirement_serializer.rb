class RequirementSerializer < ActiveModel::Serializer
  attributes :id, :skill_name
  belongs_to :skill
  belongs_to :project

  def skill_name
    object.skill.name
  end
end
