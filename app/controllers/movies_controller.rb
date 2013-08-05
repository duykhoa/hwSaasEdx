class MoviesController < ApplicationController
  before_filter :check_session, only: :index

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings = Movie.pluck(:rating).uniq
    params[:ratings]? @movies = Movie.rating(params[:ratings].map { |key,value| key }) : @movies = Movie.all
    if params[:sort]
      @movies = @movies.sort_by(&:"#{params[:sort]}")
    end

    save_session params[:sort], params[:ratings]
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

  private
  def check_session
    redirect_to movies_path(params.merge(@merge_params)) if is_redirected
  end

  def save_session sort, ratings
    session[:sort] = sort
    session[:ratings] = ratings
  end

  def is_redirected
    @merge_params = Hash.new()
    if !params[:sort] && session[:sort]
      @merge_params.merge!({sort: session[:sort]})
      true
    end

    if !params[:ratings] && session[:ratings]
      @merge_params.merge!({ratings: session[:ratings]})
      true
    end
  end
end
