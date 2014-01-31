class Maker < ActiveRecord::Base
  has_many :users
  validates :name, presence: true, length: { minimum: 5}
  include Gravtastic
  gravtastic
end
