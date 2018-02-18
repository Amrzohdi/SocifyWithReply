class Conversation < ActiveRecord::Base
  validates_uniqueness_of :sender_id, scope: :recipient_id

end
