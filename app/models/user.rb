class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	
	validates :name,  :presence => true, length: { maximum: 50 }
	validates :email, :presence => true, 	format: { with: /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i },
                    uniqueness: { case_sensitive: false }
					
	has_secure_password
	
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
