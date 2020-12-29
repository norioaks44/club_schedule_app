class SkillsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :searching_skills, only: [:index, :search_skill]

  def index
    @news = Skill.limit(10).order(" created_at DESC ")
    @skills = Skill.includes(:user).order("created_at desc")
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    if @skill.save
      redirect_to skills_path
    else
      render :new
    end
  end

  def show
    @skill = Skill.find(params[:id])
  end
  
  def edit
    @skill = Skill.find(params[:id])
  end
  
  def update
    @skill = Skill.find(params[:id])
    if @skill.update(skill_params)
      redirect_to skill_path
    else
      render :edit
    end
  end
  
  def destroy
    @skill = Skill.find(params[:id])
    if @skill.destroy
      redirect_to skills_path
    else
      render :show
    end
  end

  def search
    return nil if params[:keyword] == ""

  end
  
  def search_skill
    @results = @p.result
  end
  
  private
  def skill_params
    params.require(:skill).permit(:drill_name, :info, :category_id, :genre_id, :video, :image).merge(user_id: current_user.id)
  end

  def searching_skills
    @p = Skill.ransack(params[:q])
  end

end