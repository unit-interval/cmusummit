class Presentation < ActiveRecord::Base
  has_many :guests, :through => :sessions, :uniq => true
  has_many :users, :through => :followings, :uniq => true
  has_many :sessions
  has_many :followings

  validates :title, :datatype, :content, :date, :time, :presence => true
  validates :title, :length => { :maximum => 1024 }
  validates :datatype, :inclusion => { :in => %w(keynote panel) }
end
