class PlanWorkoutsController < ApplicationController
  before_action :set_plan
  before_action :set_plan_workout, only: [:show, :update, :destroy]

  # GET /plan_workouts
  # GET /plan_workouts.json
  def index
    @plan_workouts = PlanWorkout.where(:plan_id => @plan.id)

    render json: @plan_workouts
  end

  # GET /plan_workouts/1
  # GET /plan_workouts/1.json
  def show
    render json: @plan_workout
  end

  # POST /plan_workouts
  # POST /plan_workouts.json
  def create
    @plan_workout = @plan.plan_workouts.create(plan_workout_params)

    render json: @plan_workout
  end

  # PATCH/PUT /plan_workouts/1
  # PATCH/PUT /plan_workouts/1.json
  def update
    @plan_workout = PlanWorkout.find(params[:id])

    if @plan_workout.update(plan_workout_params)
      head :no_content
    else
      render json: @plan_workout.errors, status: :unprocessable_entity
    end
  end

  # DELETE /plan_workouts/1
  # DELETE /plan_workouts/1.json
  def destroy
    @plan_workout.destroy

    head :no_content
  end

  private

    def set_plan
      @plan = Plan.find(params[:plan_id])
    end
    def set_plan_workout
      @plan_workout = PlanWorkout.find(params[:id])
    end

    def plan_workout_params
      params.permit(:name, :order)
    end
end
