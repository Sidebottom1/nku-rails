class User < ActiveRecord::Base
  has_many :attendances
  has_secure_password
  validates_presence_of :password, :on => :create
  validates :email, :uniqueness => true
  
  def self.in_seat(seat, now=Date.today)
    present(now).where('attendances.seat = ?', seat)
  end
  
  def self.absent(now=Date.today)
    all - present(now)
  end
  
  def self.present(now=Date.today)
    joins(:attendances).where(attendances: {attended_on: now})
  end
  
  def avatar
    Avatar.from_student(self)
  end
  
  include Gravtastic
  gravtastic :email
end