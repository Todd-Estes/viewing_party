class MoviesController < ApplicationController
  def index
    conn = Faraday.new("https://api.themoviedb.org") do |f|
      f.params[:api_key] = ENV["MOVIE_SEARCH_API_KEY"]
    end

    suffix = "/3/movie/top_rated?"
    @movie_results = []
    page = 1

    until @movie_results.length == 40
      response = conn.get("#{suffix}&language=en-US&page=#{page}")
      @json = JSON.parse(response.body, symbolize_names: true)
      @json[:results].each { |f| @movie_results << f }
      page += 1
    end
    @movie_results
  end

  def show
  end
  
end
