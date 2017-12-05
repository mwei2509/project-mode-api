class QualificationsController < ApplicationController
  def index
    account = Account.find(Auth.decode(request.headers['token'])["account_id"])
    qualifications = account.qualifications
    if account
      render json: account.qualifications
    else
      render json: { error: 'Unable to find qualifications' }, status: 401
    end
  end

  def create
    account = Account.find(Auth.decode(request.headers['token'])["account_id"])
    skill = Skill.find_or_create_by(name: qualification_params[:skill].downcase)
    qualification = Qualification.new(account: account, skill: skill)
    if qualification.valid?
      qualification.save
      render json: qualification
    else
      render json: { errors: qualification.errors }, status: 401
    end
  end

  def destroy
    qualification = Qualification.find(params[:id])
    if qualification
      qualification.destroy
      render json: { success: params[:id] }
    else
      render json: { errors: params[:id] + ' was not found' }
    end
  end

  private
  def qualification_params
    params.require(:qualification).permit(:skill)
  end
end
