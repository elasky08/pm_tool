class Task < ApplicationRecord
  belongs_to :projects
  validates :title, presence: {message: "title must not be blank!"}
end
