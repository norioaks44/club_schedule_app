class ReviewsController < ApplicationController

  def index
    query = "SELECT * FROM events ORDER BY start_time DESC"
    @events = Event
    .find_by_sql(query)
    # .order(start_time: :desc).limit(10)
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to reviews_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private
  def review_params
    params.require(:review).permit(:match_genre_id, :opponent_team, :comment, :match_url).merge(user_id: current_user.id, event_id: params[:event_id])
  end
end
