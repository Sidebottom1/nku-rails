class Assignment < ActiveRecord::Base

  def percentage
    (score / total) * 100
  end
  
  def self.average_percentage
    (all.sum(:score) / all.sum(:total)) * 100
  end
  
end