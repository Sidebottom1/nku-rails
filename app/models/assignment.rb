class Assignment < ActiveRecord::Base
  belongs_to :user
  
  def percentage
    (score / total) * 100
  end
  
  def self.average_percentage
    (all.sum(:score) / all.sum(:total)) * 100
  end
  
end