class Session < ActiveRecord::Base
  belongs_to :guest
  belongs_to :presentation

  validates :guest_id, :presentation_id, :presence => true
end
