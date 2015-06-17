module PostsHelper

  def people_I_follow_ids
    friends_id_array = []
    current_user.following.each do |user|
      friends_id_array << user.id
    end
    friends_id_array
  end

end
