class Post < ApplicationRecord
  belongs_to :character
  delegate :name, to: :character, prefix: true

  validates :content, presence: true, length: { maximum: 280 }

  before_validation :sanitize_content

  private

  def sanitize_content
    self.content = ActionController::Base.helpers.strip_tags(content.to_s).squish
  end
end
