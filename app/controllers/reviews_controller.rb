class ReviewsController < ApplicationController
  before_action :no_match_block, only: :new
  before_action :review_double_block, only: :new
  
  def index
    @reviews = Review.order(created_at: :desc).limit(10)
  end

  def new
    @review = Review.new
    @event = Event.find(params[:event_id])
  end
  
  def create
    @review = Review.new(review_params)
    if @review.valid?
      @review.save
      redirect_to reviews_path
    else
      render :new
    end
  end

  def show
    load_review
  end
  
  def edit
    load_review
  end
  
  def update
    load_review
    if @review.update(update_params)
      redirect_to review_path
    else
      render :edit
    end
  end
  
  def destroy
    load_review
    if @review.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def review_params
    params.require(:review).permit(:match_genre_id, :opponent_team, :comment, :match_url).merge(user_id: current_user.id, event_id: params[:event_id])
  end
  
  def update_params
    params.require(:review).permit(:match_genre_id, :opponent_team, :comment, :match_url)
  end

  def load_review
    @review = Review.find(params[:id])
  end

  def no_match_block
    @event = Event.find(params[:event_id])
    if @event.title_id == 4 
    elsif @event.title_id == 5
    else
      redirect_to root_path
    end
  end

  def review_double_block
    if @event.review != nil
      redirect_to reviews_path
    end
  end
end
