class User < ApplicationRecord
  has_many :feedbacks, dependent: :destroy
  has_many :tests, dependent: :destroy
  has_many :user_subjects, dependent: :destroy
  has_many :subjects, through: :user_subjects, dependent: :destroy

  devise :database_authenticatable, :registerable

  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true
end
