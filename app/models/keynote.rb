class Keynote < ActiveRecord::Base
  has_many :sessions
  has_many :speakers, :through => :sessions, :uniq => true

  validates :title, :presence => true
  validates :title, :length => { :maximum => 1024 }
end
