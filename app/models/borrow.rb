class Borrow < ApplicationRecord
  belongs_to :librarian
  belongs_to :book
end
