class Discussion < ApplicationRecord
  belongs_to :project

  validates :description, presence: true
end
