class TasksController < ApplicationController
  before_action :set_project

  def create
    @task = @project.tasks.build(task_params.merge(user: current_user))

    respond_to do |format|
      if @task.save
        format.html { redirect_to @project, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task = @project.tasks.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to @project, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_project
      @project = Project.find(params[:project_id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:description, :project_id, :user_id)
    end
end
