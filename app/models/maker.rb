class Maker < ActiveRecord::Base
  has_many :users
  validates :name, presence: true
  include Gravtastic
  gravtastic :email
end
