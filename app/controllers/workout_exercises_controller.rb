class WorkoutExercisesController < ApplicationController
  before_action :set_plan
  before_action :set_plan_workout
  before_action :set_workout_exercise, only: [:show, :update, :destroy]

  # GET /workout_exercises
  # GET /workout_exercises.json
  def index
    @workout_exercises = WorkoutExercise.all

    render json: @plan_workout
  end

  # GET /workout_exercises/1
  # GET /workout_exercises/1.json
  def show
    render json: @workout_exercise
  end

  # POST /workout_exercises
  # POST /workout_exercises.json
  def create
      
    @workout_exercise = @plan_workout.workout_exercises.create(workout_exercise_params)

    render json: @workout_exercise
  end

  # PATCH/PUT /workout_exercises/1
  # PATCH/PUT /workout_exercises/1.json
  def update
    @workout_exercise = WorkoutExercise.find(params[:id])

    if @workout_exercise.update(workout_exercise_params)
      head :no_content
    else
      render json: @workout_exercise.errors, status: :unprocessable_entity
    end
  end

  # DELETE /workout_exercises/1
  # DELETE /workout_exercises/1.json
  def destroy
    @workout_exercise.destroy

    head :no_content
  end

  private

    def set_plan
      @plan = Plan.find(params[:plan_id])
    end


    def set_plan_workout
      @plan_workout = PlanWorkout.find(params[:plan_workout_id])
      puts 'this is a test'
      puts params[:plan_workout_id]
    end


    def set_workout_exercise
      @workout_exercise = WorkoutExercise.joins(:exercise).find(params[:id])
    end

    def workout_exercise_params
      params.permit(:exercise_id, :sets, :reps, :order)
    end
end
