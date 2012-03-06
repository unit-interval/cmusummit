class Presentation < ActiveRecord::Base
  has_many :guests, :through => :sessions, :uniq => true
  has_many :users, :through => :followings, :uniq => true
  has_many :sessions, :dependent => :destroy
  has_many :followings, :dependent => :destroy

  validates :title, :datatype, :content, :time, :presence => true
  validates :title, :length => { :maximum => 1024 }
  validates :datatype, :inclusion => { :in => %w(keynote panel) }
end
