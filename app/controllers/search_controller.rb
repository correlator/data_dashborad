class SearchController < ApplicationController
  def index
    results = PgSearch.multisearch(query).limit(15)
    results = results.map(&:searchable).compact
    results = results.map(&:to_search_result)
    respond_to do |format|
      format.json { render json: results }
    end
  end

  private

  def query
    params[:query]
  end
end
