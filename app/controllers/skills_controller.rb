class SkillsController < ApplicationController
  def index
    skills = Skill.all
    render json: skills
  end

  def create
    skill = Skill.find_or_create_by(name: skill_params[:name].downcase)
    if skill.valid?
      render json: skill
    else
      render json: { errors: skill.errors }, status: 401
    end
  end

  private
  def skill_params
    params.require(:skill).permit(:name)
  end
end
