class Following < ActiveRecord::Base
  belongs_to :user
  belongs_to :presentation
  belongs_to :guest

  validates :user_id, :presence => true
  validate :follow_either_presentation_or_guest

  private

  def follow_either_presentation_or_guest
    errors.add(:user_id, 'must follow something.') unless presentation_id.present? || guest_id.present?
  end
end
