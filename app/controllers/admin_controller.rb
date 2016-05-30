class AdminController < ApplicationController
  def index
    @total_tasks = Task.where(performer_id: session[:user_id], executed: false).count
  end
end
