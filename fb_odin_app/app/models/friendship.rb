class Friendship < ActiveRecord::Base

  validates :user_1_id, presence: true
  validates :user_2_id, presence: true
  validates :user_1_status, inclusion: { in: %w{ active pending blocking } }
  validates :user_2_status, inclusion: { in: %w{ active pending blocking } }


  belongs_to :user_1, class: User
  belongs_to :user_2, class: User
end
