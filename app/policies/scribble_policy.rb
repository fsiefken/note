class ScribblePolicy < ApplicationPolicy
  def show?   ; record.user == user; end
  def create? ; true;                end
  def update? ; record.user == user; end
  def destroy?; record.user == user; end
  def edit    ; true;                end
end
 