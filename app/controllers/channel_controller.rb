class ChannelController < ApplicationController
  def show
    account = Account.find(Auth.decode(request.headers['token'])["account_id"])
    category = Category.find_by(name: params[:channel])
    skill = Skill.find_by(name: params[:channel])

    is_subscribed = (account && category) ? category.find_subscription(account):false
    has_skill = (account && skill) ? skill.find_qualified(account):false
    category_proj = begin category.projects rescue false end
    skill_proj = begin skill.projects rescue false end
    projects = (category_proj && skill_proj ? category_proj.or(skill_proj) : (category_proj ? category_proj : (skill_proj ? skill_proj : Project.none)));

    # first_name_relation.or(last_name_relation)
    # projects = (category ? ProjectSerializer.new(category.projects) : []) + (skill ? ProjectSerializer.new(skill.projects) : [])
    #render empty array if no projects found
    render json: {
      name: params[:channel],
      category: category ? CategorySerializer.new(category):{},
      skill: skill ? SkillSerializer.new(skill):{},
      projects: ActiveModelSerializers::SerializableResource.new(projects.limit(params[:limit]).offset(params[:offset]), each_serializer: ProjectSerializer),
      is_subscribed: is_subscribed,
      has_skill: has_skill
    }
  end

  def subscription
    #returns subscription id
    account = Account.find(Auth.decode(request.headers['token'])["account_id"])
    category = Category.find_by(name: params[:channel])
    subscription = (account && category) ? category.find_subscription(account):false
    render json: { subscription: subscription }
  end
end
