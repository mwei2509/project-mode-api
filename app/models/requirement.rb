class Requirement < ApplicationRecord
  belongs_to :project, optional: true, touch: true
  belongs_to :skill, touch: true

  validates :skill, uniqueness: { scope: :project }

  def skill_name
    skill && skill.name
  end

  def skill_name=(skill_name)
    self.skill = Skill.find_or_create_by(name: skill_name.downcase) unless skill_name.blank?
  end
end
