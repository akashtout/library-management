class Book < ApplicationRecord
  belongs_to :author
  has_many :borrows 
  has_many :librarians
  validates :title,:price,:author_name,:author_id, presence: true
end
