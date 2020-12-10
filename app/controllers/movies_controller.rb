class MoviesController < ApplicationController
  def index
    suffix = '/3/movie/top_rated?'
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
    id = params['id'].to_i

    @cast = SearchFacade.credits(id)
    @details = SearchFacade.details(id)
    @reviews = SearchFacade.reviews(id)

    @similar_movies = SearchFacade.similar_movies(id)
    @upcoming_movies = SearchFacade.upcoming_movies
  end

  private

  def conn
    Faraday.new('https://api.themoviedb.org') do |f|
      f.params[:api_key] = ENV['MOVIE_SEARCH_API_KEY']
    end
  end
end
