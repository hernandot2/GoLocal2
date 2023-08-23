
class SearchController < ApplicationController
  def index
    query = params[:query]
    @locations = Location.search(query)
    @events = Event.search(query)
    @cities = City.search(query)
    @neighborhoods = Neighborhood.search(query)

    respond_to do |format|
      format.html
      format.text { render partial: "search/results", formats: [:html] }
    end
  end
end
