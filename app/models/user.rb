require 'digest/sha2'

class User < ActiveRecord::Base
  has_many :guests, :through => :followings, :uniq => true
  has_many :presentations, :through => :followings, :uniq => true
  has_many :contacts, :through => :followings, :uniq => true
  has_many :followers, :through => :reverse_followings, :source => :user, :uniq => true
  has_many :followings, :dependent => :destroy
  has_many :reverse_followings, :class_name => "Following", :foreign_key => "contact_id", :dependent => :destroy

  validates :email, :encrypted_password, :salt, :last_name, :first_name, :title, :presence => true
  validates :email, :uniqueness => true
  validates :email, :password, :confirmation => true
  validates :email_confirmation, :presence => true, :on => :create
  validates :password_confirmation, :presence => true, :if => :encrypted_password_changed?
  validates :password, :length => { :minimum => 6 }, :if => :encrypted_password_changed?
  validates :email, :salt, :last_name, :first_name, :length => { :maximum => 255 }

  attr_accessible :email, :email_confirmation, :password, :password_confirmation, :last_name, :first_name, :gender, :title, :fb_username
  attr_accessor :password

  def self.authenticate(email, password)
    if user = find_by_email(email)
      if user.encrypted_password == encrypt_password(password, user.salt)
        user
      end
    end
  end
  def self.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(salt + 'foo' + Digest::SHA2.hexdigest(salt + 'NaCl' + password.to_s + 'blah' + salt) + 'bar' + salt)
  end
  def self.generate_temp_password(len = 6)
    chars = (('a'..'z').to_a + ('2'..'9').to_a) - %w(i o l)
    (1..len).collect { chars[rand(chars.size)] } .join
  end

  def fb_profile_url
    "http://facebook.com/#{fb_username}" unless fb_username.nil? or fb_username.empty?
  end
  def full_name
    "#{first_name} #{last_name}"
  end
  def password=(password)
    @password = password

    if @password.present?
      generate_salt
      self.encrypted_password = self.class.encrypt_password(password, salt)
    end
  end
  def profile_picture
    if fb_username and not fb_username.empty?
      "http://graph.facebook.com/#{fb_username}/picture"
    elsif gender == false
      "default_avatar_female.jpg"
    else
      "default_avatar_male.jpg"
    end
  end

  private

  def generate_salt
    self.salt = self.object_id.to_s + Time.now.to_s + rand.to_s
  end
end
