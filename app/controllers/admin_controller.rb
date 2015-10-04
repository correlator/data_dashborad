class AdminController < ApplicationController
  layout 'admin'
  before_filter :authorize_admin
end
