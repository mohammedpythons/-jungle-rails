class User < ActiveRecord::Base
    has_secure_password
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: {minimum: 4}
    validates :password_confirmation, presence: true
    validates_confirmation_of :password, :password_confirmation
    validates :first_name, presence: true
    validates :last_name, presence: true

    def self.authenticate_with_credentials(email, password)
        user = User.find_by_email(email.strip.downcase)
        if user && user.authenticate(password)
          return user
        else
            return nil
        end

    end
end
