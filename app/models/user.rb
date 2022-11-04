class User < ApplicationRecord
    before_save  { self.email = email.downcase }
    # this in the case the user is deleted then all his articles will be too
    has_many :articles, dependent: :destroy
    REGEX_EMAIL_VALIDATION = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3 , maximum: 20 }
    validates :email, presence: true, format: { with: REGEX_EMAIL_VALIDATION}
    has_secure_password
end