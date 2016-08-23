class Task < ApplicationRecord
  validates :title, presence: {message: "title must not be blank!"}
end
