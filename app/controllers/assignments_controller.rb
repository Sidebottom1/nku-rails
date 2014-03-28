class AssignmentsController < ApplicationController
  before_action :require_admin, only: [:new, :create]
  
  def upload
    require 'csv'
    number = StudentUploader.new(params[:picture]).import
    redirect_to users_path, notice: "#{number} assignment(s) were created."
  end
  
  def index
    if current_user.admin?
      if params[:user_id].present?
        @assignments = User.find(params[:user_id]).assignments
      else
        @assignments = Assignment.all
      end
    else
      @assignments = current_user.assignments
    end
  end
  
  def new
    @assignment = Assignment.new
  end
  
  def create
    @assignment = Assignment.new(assignment_params)
    
    if @assignment.save
      redirect_to users_path, notice: "You have successfully created the assignment."
    else
      render 'new'
    end
  end
  
  private
    def assignment_params
      params.require(:assignment).permit(:user_id, :name, :score, :total)
    end
end
