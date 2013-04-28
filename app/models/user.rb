class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :username, :password, :password_confirmation

  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :password_confirmation, :on => :create
  validates_confirmation_of :password, :on => :create

  def self.authenticate(name, password)
    find_by_username(name).try(:authenticate, password)
  end
end
