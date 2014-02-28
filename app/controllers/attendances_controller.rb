class AttendancesController < ApplicationController
  
  def index
    if params[:user_id].present?
      @attendances = User.find(params[:user_id]).attendances
    else
      @attendances = Attendance.all
    end
  end
  
  def new
    @attendance = Attendance.new
  end
  
  def create
    @attendance = Attendance.new(attendance_params)
    @attendance.user = current_user
    @attendance.attended_on = Date.today
    if (Attendance.where(:attended_on => Date.today,:user_id => current_user)).first == nil
      if @attendance.save
        redirect_to attendances_path, notice: "You have successfully logged your attendance."
      else
        render 'new'
      end
    else
      flash[:error] = "You have already created an attendance for today."
      redirect_to users_path
    end
  end
    
  private
    def attendance_params
      params.require(:attendance).permit(:seat)
    end
end