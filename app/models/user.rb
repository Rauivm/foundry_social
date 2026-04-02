class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable

  has_many :characters, dependent: :destroy

  validates :email, presence: true, uniqueness: true
end
