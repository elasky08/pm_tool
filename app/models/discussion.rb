class Discussion < ApplicationRecord
  belongs_to :project
  has_many :comments, dependent: :destroy

  validates :description, presence: {message: "his message is from discussion model"}
end
