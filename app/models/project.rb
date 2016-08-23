class Project < ApplicationRecord
  validates :title, presence: {message: "title must not be blank!"}
  validates :description, presence: {message: "description cannot be blank!"}
end
