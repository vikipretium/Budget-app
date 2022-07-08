class Ability
  include CanCan::Ability

  def initialize(user)
  
    can :manage, Entity do |entity|
      entity.author == user
    end

    can :manage, Group do |group|
      group.author == user.id
    end
  end
end
