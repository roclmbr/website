class User < ActiveRecord::Base
    has_many :articles, dependent: :destroy
    has_many :images
    before_save { self.email = email.downcase }
    has_secure_password
    validates :username, presence: true,
        length: { minimum: 3, maximum: 25 }
    validates :first_name, presence: true,
        length: { minimum: 3, maximum: 25 }
    validates :last_name, presence: true,
        length: { minimum: 3, maximum: 25 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 105 },
        uniqueness: { case_sensitive: false },
        format: { with: VALID_EMAIL_REGEX }
    
    before_save { self.email = email.downcase }
end