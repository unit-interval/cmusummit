class Following < ActiveRecord::Base
  belongs_to :user
  belongs_to :presentation
  belongs_to :guest
  belongs_to :contact, :class_name => "User"

  validates :user_id, :presence => true
  validate :follows_a_presentation_or_a_guest_or_a_user

  private

  def follows_a_presentation_or_a_guest_or_a_user
    errors.add(:user_id, 'must follow something.') unless presentation_id.present? || guest_id.present? || contact_id.present?
  end
end
