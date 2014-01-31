class User < ActiveRecord::Base

  validates :name, presence: true
  include Gravtastic
  gravtastic :email
end