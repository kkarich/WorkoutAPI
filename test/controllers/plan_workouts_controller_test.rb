require 'test_helper'

class PlanWorkoutsControllerTest < ActionController::TestCase
  setup do
    @plan_workout = plan_workouts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plan_workouts)
  end

  test "should create plan_workout" do
    assert_difference('PlanWorkout.count') do
      post :create, plan_workout: { name: @plan_workout.name, order: @plan_workout.order, plan: @plan_workout.plan, reps: @plan_workout.reps, sets: @plan_workout.sets }
    end

    assert_response 201
  end

  test "should show plan_workout" do
    get :show, id: @plan_workout
    assert_response :success
  end

  test "should update plan_workout" do
    put :update, id: @plan_workout, plan_workout: { name: @plan_workout.name, order: @plan_workout.order, plan: @plan_workout.plan, reps: @plan_workout.reps, sets: @plan_workout.sets }
    assert_response 204
  end

  test "should destroy plan_workout" do
    assert_difference('PlanWorkout.count', -1) do
      delete :destroy, id: @plan_workout
    end

    assert_response 204
  end
end
