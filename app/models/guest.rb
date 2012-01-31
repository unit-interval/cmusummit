class Guest < ActiveRecord::Base
  has_many :sessions
  has_many :presentations, :through => :sessions, :uniq => true

  validates :last_name, :first_name, :title, :presence => true
  validates :last_name, :first_name, :length => { :maximum => 255 }
  validates :title, :length => { :maximum => 1024 }
end