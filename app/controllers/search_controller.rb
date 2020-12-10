class SearchController < ApplicationController
  def index
    if !params['Search by movie title'].empty?
      @search = SearchFacade.results(params['Search by movie title'])
    else
      flash[:error] = 'Please enter a valid movie title'
      redirect_to discover_index_path
    end
  end
end
