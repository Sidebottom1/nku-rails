class Attendance < ActiveRecord::Base
  belongs_to :user
  validates_numericality_of :seat, only_integer: true
  validates_numericality_of :seat, less_than: 5
  validates_numericality_of :seat, greater_than: 0
end