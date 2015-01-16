class User < ActiveRecord::Base
	validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..30 }
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence =>true, :length => {:in => 5..30}
  validates :mobile_no, :length => {:is => 10}
	attr_accessible :id, :name, :username, :password, :email, :mobile_no, :location

  def self.authenticate(username="", login_password="")
   
    user = User.find_by_username(username)

    if user && (user.password == login_password)
      return user
    else
      return false
    end
  end   


end