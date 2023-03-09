class SamplePackPolicy
  attr_reader :user, :post

  def initialize(user, sample_pack)
    @user = user
    @sample_pack = sample_pack
  end

  def new?
    !user
  end

  def create?
    !user
  end

  def edit?
    !user
  end

  def update?
    !user
  end
end