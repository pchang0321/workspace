class ReviewsController < ApplicationController
  before_action :current_user_must_be_review_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_review_user
    review = Review.find(params[:id])

    unless current_user == review.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.reviews.ransack(params[:q])
    @reviews = @q.result(:distinct => true).includes(:user, :space).page(params[:page]).per(10)

    render("reviews/index.html.erb")
  end

  def show
    @review = Review.find(params[:id])

    render("reviews/show.html.erb")
  end

  def new
    @review = Review.new

    render("reviews/new.html.erb")
  end

  def create
    @review = Review.new

    @review.user_id = params[:user_id]
    @review.space_id = params[:space_id]
    @review.ambience = params[:ambience]
    @review.roominess = params[:roominess]
    @review.fooddrink = params[:fooddrink]
    @review.outlets = params[:outlets]
    @review.wifi = params[:wifi]

    save_status = @review.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/reviews/new", "/create_review"
        redirect_to("/reviews")
      else
        redirect_back(:fallback_location => "/", :notice => "Review created successfully.")
      end
    else
      render("reviews/new.html.erb")
    end
  end

  def edit
    @review = Review.find(params[:id])

    render("reviews/edit.html.erb")
  end

  def update
    @review = Review.find(params[:id])
    @review.space_id = params[:space_id]
    @review.ambience = params[:ambience]
    @review.roominess = params[:roominess]
    @review.fooddrink = params[:fooddrink]
    @review.outlets = params[:outlets]
    @review.wifi = params[:wifi]

    save_status = @review.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/reviews/#{@review.id}/edit", "/update_review"
        redirect_to("/reviews/#{@review.id}", :notice => "Review updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Review updated successfully.")
      end
    else
      render("reviews/edit.html.erb")
    end
  end

  def destroy
    @review = Review.find(params[:id])

    @review.destroy

    if URI(request.referer).path == "/reviews/#{@review.id}"
      redirect_to("/", :notice => "Review deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Review deleted.")
    end
  end
end
