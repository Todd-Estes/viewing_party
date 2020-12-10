class Review
  attr_reader :total_results, :results

  def initialize(attributes)
    @total_results = attributes[:total_results] || 'Unknown'
    @results = attributes[:results] || 'Unknown'
  end

  def author
    if @results.empty? || @results[0][:author].nil?
      'Unknown'
    else
      @results[0][:author]
    end
  end

  def content
    if @results.empty? || @results[0][:content].nil?
      'Unknown'
    else
      @results[0][:content]
    end
  end
end
