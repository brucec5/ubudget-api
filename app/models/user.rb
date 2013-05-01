class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :username, :password, :password_confirmation

  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :password_confirmation, :on => :create
  validates_confirmation_of :password, :on => :create

  PROTECTED_ATTRIBUTES = [:password_digest]

  # Try to find a user with matching username and password.
  # Returns false if none is found.
  def self.authenticate(username, password)
    find_by_username(username).try(:authenticate, password)
  end

  # Prevent certain fields from appearing in JSON serialization
  def as_json(options = {})
    options[:except] ||= PROTECTED_ATTRIBUTES
    super(options)
  end
end
