class Task < ApplicationRecord
  after_initialize :set_status_default

  belongs_to :project
  validates :title, presence: true

  def set_status_default
    self.status ||= false
  end
end
