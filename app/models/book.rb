class Book < ApplicationRecord
  
  acts_as_paranoid recover_dependent_associations: true
  belongs_to :author
  has_many :borrows, dependent: :destroy
  belongs_to :librarian
  validates :title,:price,:author_name,:author_id, presence: true
end
