require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # enforce that all fields are full

  # no duplicates? this is kinda hard b/c i have to look at both user ids

  # cant create another one if one pending

  # scenario to think about: user1 sends a friend request to user2, its unapproved, user2 then sends friend request. right at that moment you could be messed up. i feel like my validatiosn to avoid that are in controller/view? I'll have to check

end
