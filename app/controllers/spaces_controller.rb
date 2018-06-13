class SpacesController < ApplicationController
  def index
    @q = Space.ransack(params[:q])
    @spaces = @q.result(:distinct => true).includes(:reviews, :users).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@spaces.where.not(:address_latitude => nil)) do |space, marker|
      marker.lat space.address_latitude
      marker.lng space.address_longitude
      marker.infowindow "<h5><a href='/spaces/#{space.id}'>#{space.created_at}</a></h5><small>#{space.address_formatted_address}</small>"
    end

    render("spaces/index.html.erb")
  end

  def show
    @review = Review.new
    @space = Space.find(params[:id])

    render("spaces/show.html.erb")
  end

  def new
    @space = Space.new

    render("spaces/new.html.erb")
  end

  def create
    @space = Space.new

    @space.name = params[:name]
    @space.address = params[:address]
    @space.phone_number = params[:phone_number]
    @space.picture = params[:picture]

    save_status = @space.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/spaces/new", "/create_space"
        redirect_to("/spaces")
      else
        redirect_back(:fallback_location => "/", :notice => "Space created successfully.")
      end
    else
      render("spaces/new.html.erb")
    end
  end

  def edit
    @space = Space.find(params[:id])

    render("spaces/edit.html.erb")
  end

  def update
    @space = Space.find(params[:id])

    @space.name = params[:name]
    @space.address = params[:address]
    @space.phone_number = params[:phone_number]
    @space.picture = params[:picture]

    save_status = @space.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/spaces/#{@space.id}/edit", "/update_space"
        redirect_to("/spaces/#{@space.id}", :notice => "Space updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Space updated successfully.")
      end
    else
      render("spaces/edit.html.erb")
    end
  end

  def destroy
    @space = Space.find(params[:id])

    @space.destroy

    if URI(request.referer).path == "/spaces/#{@space.id}"
      redirect_to("/", :notice => "Space deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Space deleted.")
    end
  end
end
