class TasksController < ApplicationController
  skip_before_action :authorize, only: [:create, :update, :destroy]
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if task_params["executed"]
        params["task"]["executor_id"] = session[:user_id]
        params["task"]["execution_date"] = Time.now
      end
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
        if @task.executed
          curr_route_point = RoutePoint.where(id: @task.route_point_id).order(:number)[0]
          next_route_point = RoutePoint.where(route_id: @task.route_id).order(:number)[curr_route_point.number]

            if next_route_point
              task_for_next_route_point_is_created = Task.where(business_process_id: @task.business_process_id, route_point_id: next_route_point.id)[0]
              if !task_for_next_route_point_is_created
                # create new task
                task = Task.create(
                  business_process_id: @task.business_process_id,
                  route_id: @task.route_id,
                  route_point_id: next_route_point.id,
                  performer_id: next_route_point.performer_id,
                  executed: false
                  )
              end
            else
              # the last route point - lets finish BP
              business_process = BusinessProcess.where(id: @task.business_process_id)[0]#, executed: false)[0]
              if business_process
                business_process.executed = true
                business_process.execution_date = Time.now
                business_process.save
              end

            end
        end

      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:business_process_id, :executed, :route_id, :route_point_id, :performer_id, :executor_id, :execution_date, :comment)
    end
end
