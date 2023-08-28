class AuthenticationToken < ApplicationRecord
  belongs_to :user
  validates :token, presence: true
  scope :valid,  -> { where{ (expires_at == nil) | (expires_at > Time.zone.now) } }

  def self.generate(user)
    expiry = 1.month.from_now
    token = BCrypt::Password.create(SecureRandom.hex(10))
    user.authentication_tokens.create!(token: token, expires_at: expiry)
  end
end
