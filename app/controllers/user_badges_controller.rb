class UserBadgesController < ApplicationController
  def index
    @badges = current_user.user_badges
  end
end
