class Book < ApplicationRecord
  belongs_to :author
  has_many :borrows, dependent: :destroy
  belongs_to :librarian
  validates :title,:price,:author_name,:author_id, presence: true
end
