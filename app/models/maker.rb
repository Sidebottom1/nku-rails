class Maker < ActiveRecord::Base
  has_many :makers
  validates :name, presence: true, length: { minimum: 5}
  include Gravtastic
  gravtastic
end
