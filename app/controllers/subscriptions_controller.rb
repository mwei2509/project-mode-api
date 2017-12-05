class SubscriptionsController < ApplicationController

  def index
    account = Account.find(Auth.decode(request.headers['token'])["account_id"])
    subscriptions = account.subscriptions
    if account
      render json: account.subscriptions
    else
      render json: { error: 'Unable to find subscriptions' }, status: 401
    end
  end

  def create
    account = Account.find(Auth.decode(request.headers['token'])["account_id"])
    category = Category.find_or_create_by(name: subscription_params[:category].downcase)
  	subscription = Subscription.new(account: account, category: category)
    if subscription.valid?
      subscription.save
      render json: subscription
    else
      render json: { errors: subscription.errors }, status: 401
    end
  end

  def destroy
    subscription = Subscription.find(params[:id])
    if subscription
      subscription.destroy
      render json: { success: params[:id] }
    else
      render json: { errors: params[:id] + ' was not found' }
    end
  end

  private
  def subscription_params
    params.require(:subscription).permit(:category)
  end
end
