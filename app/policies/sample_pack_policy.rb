class SamplePackPolicy < ApplicationPolicy
  def initialize(user, scope)
    @artist = user
    @sample_pack = scope
  end

  def new?
    @artist
  end

  def create?
    @artist
  end

  def edit?
    @artist && @artist.id == @sample_pack.artist.id
  end

  def update?
    @artist && @artist.id == @sample_pack.artist.id
  end

  def destroy?
    @artist && @artist.id == @sample_pack.artist.id
  end
end
