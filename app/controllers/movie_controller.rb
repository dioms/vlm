class MovieController < ApplicationController
  def index
    @movies = Tire.search 'vlm' do
      query { string '*' }
    end
  end

  def show
  end
end
