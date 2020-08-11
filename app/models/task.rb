class Task < ApplicationRecord
  belongs_to :project

  scope :remaining, -> { where(completed: false) }
end
