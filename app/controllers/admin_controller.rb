class AdminController < ApplicationController
  def index
    @total_tasks = Task.count
  end
end
