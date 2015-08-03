require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = Post.new(content: "Quack", id: 1)
    @post2 = posts(:post_one)
    @user = users(:user_one)
  end

  test 'content cannot be blank' do
    @post.content = " "
    assert_not @post.valid?
  end

  test 'user_id cannot be blank' do
    @post.user_id = " "
    assert_not @post.valid?
  end


  # test "the truth" do
  #   assert true
  # end

  # post has to have a creator

  # has to have content, do i want blank posts?

  # has to belong to current user?

  # can be liked and not liked
end
