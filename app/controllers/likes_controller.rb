class LikesController < ApplicationController
  before_action :current_user

  def index
    @likes = current_user.likes
  end
end
