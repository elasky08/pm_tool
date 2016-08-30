class Project < ApplicationRecord
  # after_initialize :set_status_default

  has_many :discussions, dependent: :destroy
  has_many :tasks, dependent: :destroy
  validates :title, presence: {message: "his message is from project model1"}
  validates :description, presence: {message: "his message is from project model2"}

  # def set_status_default
  #   self.status ||= false
  # end
end
