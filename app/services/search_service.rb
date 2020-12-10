class SearchService
  def self.search_results(title)
    response = conn.get('/3/search/movie?') do |req|
      req.params[:query] = title
      req.params[:page] = 1
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_cast(id)
    response = conn.get("/3/movie/#{id}/credits?")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_details(id)
    response = conn.get("/3/movie/#{id}?")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_reviews(id)
    response = conn.get("/3/movie/#{id}/reviews?")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_similar(id)
    response = conn.get("/3/movie/#{id}/similar?")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_upcoming
    response = conn.get('/3/movie/upcoming?')

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://api.themoviedb.org') do |f|
      f.params[:api_key] = ENV['MOVIE_SEARCH_API_KEY']
    end
  end
end
