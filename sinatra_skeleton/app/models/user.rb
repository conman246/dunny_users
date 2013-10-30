class User < ActiveRecord::Base

  # TEH AUTHENTICATION YO
  def self.authenticate(email, password)
    user = User.where("email = ?", email).first
    if user
      passtest = User.find_by_email(email).password

      if passtest == password
        user
      else
        nil
      end

    else
      nil  
    end
  end
end
