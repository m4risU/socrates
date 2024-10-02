class TestCycle < ApplicationRecord
  has_many :test_cycle_days
  accepts_nested_attributes_for :test_cycle_days
  validates :name, presence: true

end
