class Group < ApplicationRecord
  validates :name, presence: true, length: { maximum: 250 }
  validates :icon, presence: true

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :group_entities
  has_many :entities, through: :group_entities

  def total_amount
    total = 0 
    entities.each do |entity|
      total += entity.amount
    end
    total
  end
end
