module ApplicationHelper

  def current_user?(user)
    user == current_user
  end

  def owner_of?(book)
  	current_user.id == book.user_id
  end

end
