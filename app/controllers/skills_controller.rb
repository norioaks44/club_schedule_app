class SkillsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @skills = Skill.limit(20).order(" created_at DESC ")
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    binding.pry
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

  private
  def skill_params
    params.require(:skill).permit(:drill_name, :info, :category_id, :genre_id, :video, :image).merge(user_id: current_user.id)
  end

  
end
