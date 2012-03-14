class Guest < ActiveRecord::Base
  has_many :presentations, :through => :sessions, :uniq => true
  has_many :users, :through => :followings, :uniq => true
  has_many :sessions, :dependent => :destroy
  has_many :followings, :dependent => :destroy

  validates :last_name, :first_name, :title, :presence => true
  validates :last_name, :first_name, :length => { :maximum => 255 }
  validates :title, :length => { :maximum => 1024 }

  translates :title, :bio, :fallbacks_for_empty_translations => true

  def full_name
    "#{first_name} #{last_name}"
  end
end
