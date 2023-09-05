
class SearchController < ApplicationController
  def index
    query = params[:query]
    @locations = policy_scope(Location).search(query)
    @events = policy_scope(Event).search(query)
    @cities = policy_scope(City).search(query)
    @neighborhoods = policy_scope(Neighborhood).search(query)

    respond_to do |format|
      format.html
      format.text { render partial: "search/results", formats: [:html] }
    end
  end
end
