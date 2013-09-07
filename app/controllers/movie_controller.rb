class MovieController < ApplicationController
  def index
    @movies = Tire.search 'articles' do
      query { string '*' }
    end
  end

  def show
  end
end
