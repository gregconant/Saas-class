class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    # check for sort_by param
    if params[:sort_by] == nil
      if session[:sort_by] == nil
        @sort_by = "title" 
      else
        @sort_by = session[:sort_by]
      end
    else
      @sort_by = params[:sort_by]
      session[:sort_by] = params[:sort_by]
    end

    
    if params[:ratings] == nil 
      if session[:ratings] == nil
        @selected_ratings = []
      else
        # not in params, but in session
        # redirect_to same page but with correct params
        @selected_ratings = session[:ratings].keys
        redirect_to movies_url(:sort_by => @sort_by, :ratings => session[:ratings])
      end
    else
      # params[:ratings] exists -- use this and store in session
      @selected_ratings = params[:ratings].keys
      session[:ratings] = params[:ratings]
    end

    @checked_boxes = Hash.new()
    @selected_ratings.each do |rating|
      @checked_boxes[rating] = 'checked'
    end
    @movies = Movie.order(@sort_by).where(:rating => @selected_ratings)
    @all_ratings = Movie.FindAllRatings
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
