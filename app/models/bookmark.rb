class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie, dependent: :destroy

  validates :comment, length: { minimum: 6 }
  validates :list_id, uniqueness: { scope: :movie_id }
end
