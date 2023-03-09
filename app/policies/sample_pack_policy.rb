class SamplePackPolicy < ApplicationPolicy
end

class Artist::SamplePackPolicy
  def initialize(artist, scope)
    @artist = artist
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
