class AdminController < ApplicationController
  skip_before_filter :set_gon
  skip_before_filter :set_session
  
  before_action :authenticate_user!
end