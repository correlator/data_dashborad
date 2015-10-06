class HomeController < ApplicationController
  def index
    @page = Page.where(landing_page: true).first
  end
end
