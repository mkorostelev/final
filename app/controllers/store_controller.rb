class StoreController < ApplicationController
  def index
    @tasks = Task.order(:created_at).where(performer_id: session[:user_id], executed: false)
  end
end
