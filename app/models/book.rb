class Book < ApplicationRecord
  include ExportCsv
  acts_as_paranoid 
  belongs_to :author
  has_many :borrows, dependent: :destroy
  belongs_to :librarian
  validates :title,:price,:author_name,:author_id, presence: true
end
