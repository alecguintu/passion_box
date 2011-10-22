class User
  include Mongoid::Document
  ROLES = ['User', 'Curator', 'Admin']
  USER, CURATOR, ADMIN = ROLES
  
  field :provider, :type => String
  field :uid, :type => String
  field :name, :type => String
  field :email, :type => String
  field :role, :type => String, :default => USER
  attr_accessible :provider, :uid, :name, :email
  
  has_many :boxes
  has_many :templates
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      
      if auth['user_info']
        user.name = auth['user_info']['name'] if auth['user_info']['name'] # Twitter, Google, Yahoo, GitHub
        user.email = auth['user_info']['email'] if auth['user_info']['email'] # Google, Yahoo, GitHub
      end
      if auth['extra'] && auth['extra']['user_hash']
        user.name = auth['extra']['user_hash']['name'] if auth['extra']['user_hash']['name'] # Facebook
        user.email = auth['extra']['user_hash']['email'] if auth['extra']['user_hash']['email'] # Facebook
      end
    end
  end
  
  def user?
    self.role == User::USER
  end
  
  def curator?
    self.role == User::CURATOR
  end
  
  def admin?
    self.role == User::ADMIN
  end
end
