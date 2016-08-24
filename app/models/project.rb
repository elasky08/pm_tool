class Project < ApplicationRecord
  has_many :discussions, dependent: :destroy

  validates :title, presence: {message: "title must not be blank!"}
  validates :description, presence: {message: "description cannot be blank!"}


end
