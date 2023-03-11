class SamplePackPolicy < ApplicationPolicy
  def initialize(user, scope)
    @user = user
    @sample_pack = scope
  end

  def new?
    @user.artist?
  end

  def create?
    @user.artist?
  end

  def edit?
    @user.artist? && @user.id == @sample_pack.user.id
  end

  def update?
    @user.artist? && @user.id == @sample_pack.user.id
  end

  def destroy?
    @user.artist? && @user.id == @sample_pack.user.id
  end
end
