class WikiPolicy < ApplicationPolicy

  def new?
    true
  end

  def index?
    user.present?
  end

  def create?
    new?
  end

  def update?
    edit?
  end

  def show?
    user.present?
  end

  def edit?
    user.present?
  end

  def destroy?
    (wiki.user == user) || user.admin?
  end

  class Scope
     attr_reader :user, :scope

     def initialize(user, scope)
       @user = user
       @scope = scope
     end

     def resolve
       wikis = []
       if user.admin?
         wikis = scope.all
       elsif user.premium?
         all_wikis = scope.all
         all_wikis.each do |wiki|
           if !wiki.private || wiki.user == user || wiki.users.include?(user)
             wikis << wiki
           end
         end
       else
         all_wikis = scope.all
         wikis = []
         all_wikis.each do |wiki|
           if !wiki.private || wiki.users.include?(user)
             wikis << wiki
           end
         end
       end
       wikis
     end
   end

  private

  def wiki
    record
  end

end