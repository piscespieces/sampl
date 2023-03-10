class LikesController < ApplicationController
  before_action :current_user

  def index
    @likes = current_user.likes
  end

  private

  def current_user
    if current_user
      current_user
    else
      current_artist
    end
  end
end
