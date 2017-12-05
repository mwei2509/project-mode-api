class ProjectsController < ApplicationController

  def index
    projects = Project.limit(params[:limit]).offset(params[:offset])
    if projects
      render json: projects
    else
      render json: { errors: "None found" }, status: 401
    end
  end

  def show
    project = Project.find(params[:id])
    if project
      render json: project
    else
      render json: { errors: "Not found" }, status: 401
    end
  end

  def create
    account = Account.find(Auth.decode(request.headers['token'])["account_id"])
    project = Project.new(project_params)
    project.creator = account
    if project.valid?
      project.save
      render json: project
    else
      render json: { errors: project.errors }, status: 401
    end
  end

  def like
    project = Project.find(params[:id])
    account = Account.find(Auth.decode(request.headers['token'])["account_id"])
    if project.creator == account
      render json: {errors: "you can't like your own project"}, status: 401
    else
      like = Like.find_or_create_by(account: account, project: project)
      like.heart += project_params[:like]
      if like.save
        render json: project
      else
        render json: {errors: "stop"}, status: 401
      end
    end
  end

  def comment
    project = Project.find(params[:id])
    account = Account.find(Auth.decode(request.headers['token'])["account_id"])
    comment = Comment.new(comment_params)
    comment.commenter = account
    comment.project = project
    if comment.save
      render json: project
    else
      render json: {errors: "couldn't save comment"}, status: 401
    end
  end

  private
  def project_params
    params.require(:project).permit(:limit, :offset, :like, :channel, :title, :description,
      tags_attributes: [:category_name],
      requirements_attributes: [:skill_name])
  end

  def comment_params
    params.require(:comment).permit(:content, :parent_id)
  end
end
