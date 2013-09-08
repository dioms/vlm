class MoviesController < ApplicationController
  def index
    @movies = Tire.search 'vlm' do
      query do
        string '*'
      end
    end
  end

  def show
    id = params[:id]
    @movie = Tire.search 'vlm' do
      query { string("_id:#{id}") }
    end
    @movie = @movie.results.first
  end

  def search
    query = params[:query]
    @movies = Tire.search 'vlm', :query => { :prefix => { :title => query } }
    render :json => {:hits => @movies.results}
  end

end
