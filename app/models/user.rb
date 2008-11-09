class User
  include DataMapper::Resource

  property :id, Serial
  property :name,         String, :length => 255
  property :email,        String, :length => 255
  property :identity_url, String, :length => 255
  property :admin,        Boolean, :default => false

  validates_is_unique :name, :allow_nil => true  
  validates_is_unique :email, :allow_nil => :using_openid?
  validates_format :email, :as => :email_address, :allow_nil => :using_openid?
  validates_is_unique :identity_url, :allow_nil => :using_password?

  def using_openid?
    !using_password?
  end

  def using_password?
    identity_url.blank?
  end

  def password_required?
    !using_openid?
  end
end