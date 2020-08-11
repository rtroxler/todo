class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, only: [:edit, :update, :destroy, :complete, :uncomplete]

  def edit
  end

  def create
    @task = @project.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @project, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { redirect_to @project, notice: 'Task creation failed.' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @project, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to @project, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def complete
    @task.update completed: true

    respond_to do |format|
      format.html { redirect_to @project }
      format.json { head :no_content }
    end
  end

  def uncomplete
    @task.update completed: false

    respond_to do |format|
      format.html { redirect_to @project }
      format.json { head :no_content }
    end
  end

  private
    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_task
      @task = @project.tasks.find(params[:id] || params[:task_id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:description, :project_id)
    end
end
