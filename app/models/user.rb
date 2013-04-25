class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :name, :password, :password_confirmation

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :password_confirmation, :on => :create
  validates_confirmation_of :password, :on => :create

  def self.authenticate(name, password)
    find_by_name(name).try(:authenticate, password)
  end
end
