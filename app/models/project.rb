class Project < ApplicationRecord
  # after_initialize :set_status_default

  has_many :discussions, dependent: :destroy
  has_many :tasks, dependent: :destroy
  validates :title, presence: {message: "his message is from project model1"}
  validates :description, presence: {message: "his message is from project model2"}

  belongs_to :user
  # def set_status_default
  #   self.status ||= false
  # end

  def self.search(search_term)
    where(["title ILIKE ? OR description ILIKE?", "%#{search_term}%", "%#{search_term}%"])
  end

end
