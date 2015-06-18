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

  has_many :friendship_requests_sent, foreign_key: :user_1_id, class: Friendship
  has_many :friendship_requests_received,  foreign_key: :user_2_id, class: Friendship

  #so im implicitly saying user 1 is the sender w/o explicitly saying, could be unclear, but i want to user the friendship object to represent:
    # a request,
    # and also a record of friendship


  has_many :proactively_requested_friends, through: :initiated_friendships, source: :user_2, class: User
  has_many :reactively_requested_friends,  through: :accepted_friendships,  source: :user_1, class: User

    # the thing we are trying to pick out is who initiated the friendship,

    # did you friend me or did i friend you? why does it matter????
    # in facebook, after it happens, it doesn't, but the computer doesn't know better, a human friendship is a less specific thing

    # this is a list of USERS based on who reached out first, the actual friendship doesn't form until both parties accept

    # what do we call that?

    # User.x  returns the people i either started the friendship with or i received the friendship from

    # superiors vs. inferiors
    # superior if i recieved the friendship
    # inferior if i initiated the friendship

    # what is a name for people who initiate the friendship

    # proactive_friendships
    # reactive_friendships









  #----------likes!-----------
  has_many :likes
  has_many :liked_posts, :through => :likes, :source => :post







end
