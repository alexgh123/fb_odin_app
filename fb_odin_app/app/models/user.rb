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
  has_many :friendships #really measuring how many people have requested to follow you, like total, like ever, how many ledgers do you have to your name, pretty good measure of social currency
  has_many :passive_friendships, :class_name => "Friendship", :foreign_key => "friend_id" #like how many you have requested, super dialed in know it alls  would have a high number here

  #^not sure about this one, right now there is only one request in the database that has not been approved yet,

  #follower
  has_many :followers, -> { where(friendships: { approved: true}) }, :through => :friendships, :source => :friend #someone who requested you

  #following
  has_many :following, -> { where(friendships: { approved: true}) }, :through => :passive_friendships, :source => :user #someone you reqeusted

  #active friends: you requested, they accepted (following)
  #passive friends, they reqeusted, you accepted (followers)

  #shouldn't there be something for when both people have accepted? like besties? both requested to follow and accepted

  has_many :pending_friends, -> { where(friendships: { approved: false}) }, :through => :friendships, :source => :friend
  has_many :requested_friendships, -> { where(friendships: { approved: false}) }, :through => :passive_friendships, :source => :user

  def kinda_friends
    followers | following
  end

  def real_friends
    # of the people im following, which ones are following me?

    ride_or_die = [] #ride or die array built
    maybe_hommies_array = [] #maybe_hommies_array built

    following.each do |maybe_homie| #for each person that I'm following.....
      maybe_hommies_array << maybe_homie #i want that person put into my maybe_hommies_array

      #we will then keep them off to the side,

      #further, if that person that I am following, is also following me,

        maybe_hommies_array.each do |maybe_homie|

          if followers.include?(maybe_homie)
            ride_or_die << maybe_homie
          else
            #fuck 'em
          end

          #does this maybe homie included in my followers?
          # for each maybe_homie,
        end

      # then we be true hommies and i want to know who they is...

    end
    ride_or_die




    #for each active friend, do they have you as an active friend

    #this should measure where there is a mutual relationship, both are activefriends with each other
  end



end
