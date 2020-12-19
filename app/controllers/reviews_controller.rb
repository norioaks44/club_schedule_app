class ReviewsController < ApplicationController
  # before_action :no_match_block
  
  def index
    @reviews = Review.order(created_at: :desc).limit(10)
  end

  def new
    @review = Review.new
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

end
