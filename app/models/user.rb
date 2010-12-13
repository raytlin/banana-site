class User < ActiveRecord::Base
  has_many :bananas
  validates_presence_of :username, :password
  validates_uniqueness_of :username
  
  def self.login(username, password)
    self.find(:first, :conditions => ["username = ? AND password = ?", username, password])
  end
  
  def try_to_login 
    User.login(self.username, self.password)
  end   

end
