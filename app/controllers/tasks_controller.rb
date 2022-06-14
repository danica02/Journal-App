class TasksController < ApplicationController
  before_action :set_category
  before_action :set_task, only: %i[show edit update destroy]

  # GET /tasks
  def index
    @tasks = current_user.tasks
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
   @task = @category.tasks.build
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = @category.tasks.build(task_params)

    if @task.save
      redirect_to @category, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to @category, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to @category, notice: 'Task was successfully destroyed.'
  end

  private
    def set_category
      @category = current_user.category.find_by_id(params[:category_id])
      if @category.nil?
        redirect_to category_url
      end
    end

    def set_task
      @task = @category.tasks.find_by_id(params[:id])
      if @task.nil?
        redirect_to category_url(@category), notice: "No task id #{params[:id]} found" 
      end
    end

    def task_params
      params.require(:task).permit(:title, :notes, :date, :completed)
    end
end
