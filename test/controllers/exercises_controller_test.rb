require 'test_helper'

class ExercisesControllerTest < ActionController::TestCase
  setup do
    @exercise = exercises(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exercises)
  end

  test "should create exercise" do
    assert_difference('Exercise.count') do
      post :create, exercise: { musclegroup: @exercise.musclegroup, name: @exercise.name }
    end

    assert_response 201
  end

  test "should show exercise" do
    get :show, id: @exercise
    assert_response :success
  end

  test "should update exercise" do
    put :update, id: @exercise, exercise: { musclegroup: @exercise.musclegroup, name: @exercise.name }
    assert_response 204
  end

  test "should destroy exercise" do
    assert_difference('Exercise.count', -1) do
      delete :destroy, id: @exercise
    end

    assert_response 204
  end
end
