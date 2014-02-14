class AttendancesController < ApplicationController
  
  def index
    @attendances = Attendance.all
  end
  
  def new
    @attendance = Attendance.new
  end
  
  def create
    @attendance = Attendance.new(attendance_params)
    @attendance.user = current_user
    @attendance.attended_on = Date.today
    if @attendance.save
      redirect_to attendances_path, notice: "You have successfully logged your attendance."
    else
      render 'new'
    end
  end
    
  private
    def attendance_params
      params.require(:attendance).permit(:seat)
    end
end