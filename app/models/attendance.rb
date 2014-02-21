class Attendance < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :seat, message: "number input required"
  validates_numericality_of :seat, less_than: 5, greater_than_or_equal_to: 1, message: "number must be 1 - 4"
  validates_numericality_of :seat, only_integer: true, message: "number must be a number"
  validates :user, :uniqueness => { :message => "already signed in" }
  
end