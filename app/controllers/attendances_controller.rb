class AttendancesController < ApplicationController
  
  def index
    @attendances = Attendance.all
  end
  
  def new
    @attendance = Attendance.new
  end
  
  def create
    @attendance = Attendance.new(attendance_params)
    
    if @attendance.save
      redirect_to @attendance, notice: "You have successfully logged your attendance."
    else
      render 'new'
    end
  end
    
  private
    def attendance_params
      params.require(:attendance).permit(:attendance, :attended_on, :seat)
    end
end