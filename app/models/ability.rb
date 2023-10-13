# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)

    if user.admin?
      can :manage, :all # Admins can manage all resources
    else
      can :manage, Post, user_id: user.id
      can :manage, Comment, user_id: user.id
    end
  end
end
