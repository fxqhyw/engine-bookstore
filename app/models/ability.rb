class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    return unless user.persisted?
    can :create, Review
    #can %i[read create update], Order, user_id: user.id
  end
end
