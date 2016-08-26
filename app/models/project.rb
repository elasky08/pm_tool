class Project < ApplicationRecord
  has_many :discussions, dependent: :destroy
  has_many :tasks, dependent: :destroy
  validates :title, presence: {message: "his message is from project model1"}
  validates :description, presence: {message: "his message is from project model2"}


end
