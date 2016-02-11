require 'test_helper'

class WorkoutExercisesControllerTest < ActionController::TestCase
  setup do
    @workout_exercise = workout_exercises(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workout_exercises)
  end

  test "should create workout_exercise" do
    assert_difference('WorkoutExercise.count') do
      post :create, workout_exercise: { exercise_id: @workout_exercise.exercise_id, order: @workout_exercise.order, plan_workout: @workout_exercise.plan_workout, reps: @workout_exercise.reps, sets: @workout_exercise.sets }
    end

    assert_response 201
  end

  test "should show workout_exercise" do
    get :show, id: @workout_exercise
    assert_response :success
  end

  test "should update workout_exercise" do
    put :update, id: @workout_exercise, workout_exercise: { exercise_id: @workout_exercise.exercise_id, order: @workout_exercise.order, plan_workout: @workout_exercise.plan_workout, reps: @workout_exercise.reps, sets: @workout_exercise.sets }
    assert_response 204
  end

  test "should destroy workout_exercise" do
    assert_difference('WorkoutExercise.count', -1) do
      delete :destroy, id: @workout_exercise
    end

    assert_response 204
  end
end
