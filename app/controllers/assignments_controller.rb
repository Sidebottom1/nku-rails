class AssignmentsController < ApplicationController
  before_action do |controller|
    redirect_to users_seating_chart unless controller.send(:admin?)
  end
  
  def index
    if params[:user_id].admin?
      @assignments = Assignment.all
    else
      @assignments = User.find(params[:user_id]).assignments
    end
  end
  
  def new
    @assignment = Assignment.new
  end
  
  def create
    @assigment = Assignment.new(assignment_params)
    
    if @assignment.save
      redirect_to users_index, notice: "You have successfully created the assignment."
    else
      render 'new'
    end
  end
  
  private
    def assignment_params
      params.require().permit(:user, :name, :score, :total)
    end
end
