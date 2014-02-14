class AttendancesController < ApplicationController
  
  def new
    @attendance = Attendance.new
  end
  
  def create
    @attendance = Attendance.new(attendance_params)
  end
    
  
  private
    def attendance_params
      params.require(:attendance).permit(:attendance, :attended_on, :seat)
    end
end