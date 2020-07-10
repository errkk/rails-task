class ApplicationController < ActionController::API
  def index
    redirect_to plan_index_path
  end
end
