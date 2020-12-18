class ReviewsController < ApplicationController

  def index
    # query = "SELECT * FROM reviews ORDER BY id DESC"
    # @reviews = Review.find_by_sql(query)
    @reviews = Review.order(created_at: :desc).limit(10)
    @event = Event.find(params[:id])
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
    params.require(:review).permit(:comment, :match_url).merge(user_id: current_user.id, event_id: params[:event_id])
  end
end
