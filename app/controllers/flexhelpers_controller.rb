class FlexhelpersController < ApplicationController

  def show
    account = Account.find(Auth.decode(request.headers['token'])["account_id"])
    flexhelper = Flexhelper.find(params[:id])
    if account && flexhelper && flexhelper.account == account
      render json: flexhelper
    else
      render json: { errors: ['could not load']}, status: 401
    end
  end

  def update
    account = Account.find(Auth.decode(request.headers['token'])["account_id"])
    flexhelper = Flexhelper.find(params[:id])
    if account && flexhelper && flexhelper.account == account
      flexhelper.update(flexhelper_params)
      render json: flexhelper
    else
      render json: { errors: ['not permitted']}, status: 401
    end
  end

  def create
    account = Account.find(Auth.decode(request.headers['token'])["account_id"])
    project = Project.find(flexhelper_params[:project_id])
    flexhelper = Flexhelper.new(account: account, project: project)
    if account && project && project.creator == account && flexhelper.valid?
      flexhelper.save
      render json: flexhelper
    else
      render json: { errors: 'There has been an error' }, status: 401
    end
  end

  private
  def flexhelper_params
    params.require(:flexhelper).permit(:project_id, :flexhelper_json)
  end
end
