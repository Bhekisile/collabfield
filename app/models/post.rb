class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :title, presence: true, length: { minimum: 5, maximum: 255 }
  validates :content, presence: true, length: { minimum: 20, maximum: 1000 }
  validates :category_id, presence: true

  default_scope -> { includes(:user).order(created_at: :desc) }

  scope :by_category, lambda { |branch, category_name|
    joins(:category).where(categories: { name: category_name, branch: })
  }

  scope :by_branch, lambda { |branch|
    joins(:category).where(categories: { branch: })
  }

  scope :search, lambda { |search|
    where('title ILIKE lower(?) OR content ILIKE lower(?)', "%#{search}%", "%#{search}%")
  }
end
