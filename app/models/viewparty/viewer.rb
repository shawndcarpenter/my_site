class Viewer < ApplicationRecord
  has_many :viewer_parties
  has_many :parties, through: :viewer_parties
  validates :name, presence: true
  validates :password, presence: true
  validates :email, format: URI::MailTo::EMAIL_REGEXP, presence: true, uniqueness: true
  has_secure_password

  def self.other_viewers(exception)
    Viewer.where.not(id: exception.id).all
  end
end