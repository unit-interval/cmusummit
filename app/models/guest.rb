class Guest < ActiveRecord::Base
  has_many :presentations, :through => :sessions, :uniq => true
  has_many :users, :through => :followings, :uniq => true
  has_many :sessions, :dependent => :destroy
  has_many :followings, :dependent => :destroy

  validates :last_name, :first_name, :title, :presence => true
  validates :last_name, :first_name, :length => { :maximum => 255 }
  validates :title, :length => { :maximum => 1024 }

  translates :last_name, :first_name, :title, :bio, :fallbacks_for_empty_translations => true

  def full_name
    if I18n.locale == :zh
      "#{last_name}#{first_name}"
    else
      "#{first_name} #{last_name}"
    end
  end
end
