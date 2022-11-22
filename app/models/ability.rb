# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(librarian)
    if librarian.usertype == "librarian"
      can :read, :all
      can :manage, :all
      cannot :studentindex, Book
      cannot [:requestedbook, :borrowbook], Borrow
    else
      can :manage, :all
      cannot [:borrowshow, :overdue_date_book], Borrow
      cannot [:index,:trashbin], Book
      cannot [:index, :history, :edit, :show, :destroy], Librarian
    end
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
