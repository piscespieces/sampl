class SamplePolicy
  attr_reader :user, :sample

  def initialize(user, sample)
    @user = user
    @sample = sample
  end

  def new?
    !@user
  end

  def create?
    !@user
  end

  def edit?
    !@user
  end

  def update?
    !@user
  end
end