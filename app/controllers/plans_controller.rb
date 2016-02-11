class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :update, :destroy]
  

  # GET /plans
  # GET /plans.json
  def index
    @plans = Plan.all
    
    render json: @plans
  end

  # GET /plans/1
  # GET /plans/1.json
  def show
    # get workouts
    workouts = PlanWorkout.where(:plan_id => @plan.id)
    
    # init empty array that will contain ll of the workouts with the associated exercises
    workouts_with_exercises = []
    
    # loop through each workout, get all exercises for that workout and push that workout to the workouts with exercises array
    workouts.each do |workout|
        # get all exercises
        exercises = WorkoutExercise.joins(:exercise).where(:plan_workout_id => workout.id)
        
        # init empy exercise with details array. Going to add to it later
        exercises_with_details = []
        
        # loop through each exercise and get details about it. May want to update this later. 
        exercises.each do |exercise|
            # default exercise details -> may need to use jbuilder for now just build manually
            name = exercise.exercise.name
            musclegroup = exercise.exercise.musclegroup
            
            # convert exercise to JSON so we can add exercise details to it
            exercise = JSON.parse(exercise.to_json)
            
            # add details to exercise object 
            exercise['name'] = name
            exercise['musclegroup'] = musclegroup
            
            # push to exercises with details array
            exercises_with_details.push(exercise) 
        end
        
        # convert workout to JSON so we can add exercises to it
        workout = JSON.parse(workout.to_json)
        
        # add exercises to workout 
        workout['exercises'] = exercises_with_details
        
        # push workout with exercises to workouts with exercises array
        workouts_with_exercises.push(workout)
    end
    
    # convert associated plan to JSON so we can add workouts to it
    @plan = JSON.parse(@plan.to_json)
    
    # add workouts with exercises to plan
    @plan['workouts'] = workouts_with_exercises
    
    # render plan containing all information
    render json: @plan
  end

  # POST /plans
  # POST /plans.json
  def create
    @plan = Plan.new(plan_params)

    if @plan.save
      render json: @plan, status: :created, location: @plan
    else
      render json: @plan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /plans/1
  # PATCH/PUT /plans/1.json
  def update
    @plan = Plan.find(params[:id])

    if @plan.update(plan_params)
      head :no_content
    else
      render json: @plan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    @plan.destroy

    head :no_content
  end

  private

    def set_plan
      @plan = Plan.find(params[:id])
    end

    def plan_params
      params.permit(:name, :description)
    end
end
