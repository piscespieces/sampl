class SamplePolicy
  attr_reader :user, :post

  def initialize(user, sample)
    @user = user
    @sample = sample
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