class Entity < ApplicationRecord
  validates :name, presence: true, length: { maximum: 250 }
  validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :groups
end
