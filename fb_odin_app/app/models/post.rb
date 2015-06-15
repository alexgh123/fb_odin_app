class Post < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  #-------- the people who like my stuff! -----

  has_many :likes #dependent: :destroy #this will remove likes if the user is deleted
  has_many :liking_users, :through => :likes, :source => :user



end
