class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save { self.email = email.downcase }
  validates :first_name, presence: true, length: {maximum: 25}
  validates :last_name, presence: true, length: {maximum: 25}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 35},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  has_many :posts, dependent: :destroy

  #------------- friends! ----------------

# belongs_to :user_1, class: User

  has_many :sent_friendship_requests, foreign_key: :user_1_id, class: Friendship
  has_many :received_friendship_requests,  foreign_key: :user_2_id, class: Friendship


  has_many :proactively_requested_users, through: :initiated_friendships, source: :user_2, class: User
  has_many :reactively_requested_users,  through: :accepted_friendships,  source: :user_1, class: User




  #----------likes!-----------
  has_many :likes
  has_many :liked_posts, :through => :likes, :source => :post


  # -------- friendship logic ---------
  def friendships
    Friendship.where('user_1_id=? OR user_2_id=?', id, id).where("user_1_status='active' AND user_2_status='active'")
  end



  def friends
    User.joins('JOIN friendships f ON (users.id = f.user_1_id OR users.id = f.user_2_id)').where('users.id <> ? AND (f.user_1_id = ? OR f.user_2_id = ?)', id, id, id).uniq
  end

  def friend_requests
    self.received_friendship_requests.where(user_2_status:"pending")
  end


end
