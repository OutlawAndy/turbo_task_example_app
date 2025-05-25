class TasksController < ApplicationController
  before_action :set_task, except: %i[index new create]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
    render layout: 'modal'
  end

  def edit
    render layout: 'modal'
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :new, status: :unprocessable_content, layout: 'modal'
    end
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task was successfully updated.'
    else
      render :edit, status: :unprocessable_content, layout: 'modal'
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'Task was successfully destroyed.'
  end

  private

  def task_params
    params.expect(task: %i[name description due_at done_at done])
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
