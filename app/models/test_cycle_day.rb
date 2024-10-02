class TestCycleDay < ApplicationRecord
  belongs_to :test_cycle
  # t.integer :day_number
  # t.string :mucus
  # t.float :temp
  validates :day_number, presence: true
  validates :mucus, presence: true
  validates :temp, presence: true

end
