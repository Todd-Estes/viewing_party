class Detail
  attr_reader :title, :runtime, :vote_avg, :genres, :summary, :details_id

  def initialize(attributes)
    @title = attributes[:original_title]
    @runtime = attributes[:runtime] ? attributes[:runtime] : "Unknown"
    @vote_avg = attributes[:vote_average] ? attributes[:vote_average] : "Unknown"
    @genres = attributes[:genres] ? attributes[:genres] : "Unknown"
    @summary = attributes[:overview] ? attributes[:overview] : "Unknown"
    @details_id = attributes[:id]

  end
end
