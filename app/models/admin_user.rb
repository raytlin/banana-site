class AdminUser < ActiveRecord::Base
  
  validates_presence_of :username, :password
  validates_uniqueness_of :username
  
  def self.login(username, password)
    self.find(:first, :conditions => ["username = ? AND password = ?", username, password])
  end
  
  def try_to_login 
    AdminUser.login(self.username, self.password)
  end 
end
