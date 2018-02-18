class Conversation < ActiveRecord::Base
  validates_uniqueness_of :sender_id, scope: :recipient_id
  belongs_to :sender, foreign_key: :sender_id, class_name: "User"
  belongs_to :recipient, foreign_key: :recipient_id, class_name: "User"

  scope :involving, ->(user){ where("sender_id = ? OR recipient_id = ?", user.id, user.id)}
  scope :between,   ->(sender_id, recipient_id) {where(sender_id: sender_id, recipient_id: recipient_id)}
end
