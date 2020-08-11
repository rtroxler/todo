require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
    @project = @task.project
  end

  test "should create task and redirect back to project" do
    assert_difference('Task.count') do
      post project_tasks_url(project_id: @project.id, params: { task: { description: @task.description, project_id: @task.project_id } })
    end

    assert_redirected_to project_url(@project)
  end

  test "should get edit" do
    get edit_project_task_url(@project, @task)
    assert_response :success
  end

  test "should update task" do
    patch project_task_url(project_id: @project.id, id: @task.id), params: { task: { description: @task.description, project_id: @task.project_id } }

    assert_redirected_to project_url(@project)
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete project_task_url(project_id: @project.id, id: @task.id)
    end

    assert_redirected_to project_url(@project)
  end

  test "should complete a task" do
    get project_task_complete_path(project_id: @task.project.id, task_id: @task.id)
    assert @task.reload.completed
  end

  test "should uncomplete a task" do
    @task.update completed: true
    get project_task_uncomplete_path(project_id: @task.project.id, task_id: @task.id)
    refute @task.reload.completed
  end
end
