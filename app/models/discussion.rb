class Discussion < ApplicationRecord
  belongs_to :project
  has_many :comments, dependent: :destroy

  validates :description, presence: true
end
