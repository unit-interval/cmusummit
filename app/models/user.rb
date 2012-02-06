require 'digest/sha2'

class User < ActiveRecord::Base
  has_many :guests, :through => :followings, :uniq => true
  has_many :presentations, :through => :followings, :uniq => true
  has_many :followings

  validates :email, :encrypted_password, :salt, :last_name, :first_name, :presence => true
  validates :email, :uniqueness => true
  validates :email, :password, :confirmation => true
  validates :email_confirmation, :presence => true, :on => :create
  validates :password_confirmation, :presence => true, :if => :encrypted_password_changed?
  validates :password, :length => { :minimum => 6 }, :if => :encrypted_password_changed?
  validates :email, :salt, :last_name, :first_name, :length => { :maximum => 255 }

  attr_accessible :email, :email_confirmation, :password, :password_confirmation, :last_name, :first_name, :gender
  attr_accessor :password

  def User.authenticate(email, password)
    if user = find_by_email(email)
      if user.encrypted_password == encrypt_password(password, user.salt)
        user
      end
    end
  end
  def User.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(salt + 'foo' + Digest::SHA2.hexdigest(salt + 'NaCl' + password.to_s + 'blah' + salt) + 'bar' + salt)
  end

  def password=(password)
    @password = password

    if @password.present?
      generate_salt
      self.encrypted_password = self.class.encrypt_password(password, salt)
    end
  end

  private

  def generate_salt
    self.salt = self.object_id.to_s + Time.now.to_s + rand.to_s
  end
end
