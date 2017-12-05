class QualificationSerializer < ActiveModel::Serializer
  attributes :id, :skill_name

  def skill_name
    object.skill.name
  end
end
