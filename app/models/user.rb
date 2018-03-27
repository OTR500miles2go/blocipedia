class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis

  enum role: [:standard, :premium, :admin]

  after_initialize :initialize_role, :if => :new_record?

  private
    def initialize_role
      self.role ||= :standard
    end
end