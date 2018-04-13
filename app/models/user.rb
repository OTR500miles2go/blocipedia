class User < ApplicationRecord
  has_many :collaborators
  has_many :wikis, through: :collaborators

  after_initialize :assign_role
  before_update :downgrade

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:admin, :premium, :standard, :guest]

  def assign_role
    self.role ||= :standard
  end

  def downgrade
    wikis = Wiki.where(user_id: self.id)
    wikis.update_all(private: false)
  end

end