class Presentation < ActiveRecord::Base
  has_many :sessions
  has_many :guests, :through => :sessions, :uniq => true

  validates :title, :datatype, :content, :date, :time, :presence => true
  validates :title, :length => { :maximum => 1024 }
  validates :datatype, :inclusion => { :in => %w(keynote panel) }
end
