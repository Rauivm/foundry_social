class Character < ApplicationRecord
  MAX_CHARACTERS_PER_USER = 5

  belongs_to :user
  has_many :posts, dependent: :destroy

  validates :name, presence: true
  validate :within_user_limit

  private

  def within_user_limit
    return unless user && user.characters.where.not(id: id).count >= MAX_CHARACTERS_PER_USER

    errors.add(:base, "Character limit reached")
  end
end
