class Book < ApplicationRecord
  require 'csv'
  include ExportCsv
  paginates_per 10
  has_one_attached :image
  acts_as_paranoid 
  belongs_to :author
  has_many :borrows, dependent: :destroy
  belongs_to :librarian
  validates :title,:price,:author_name,:author_id, presence: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      book = Book.new
      book.title = row[0]
      book.price = row[1]
      book.description = row[2]
      book.author_id = row[3]
      book.author_name = row[4]
      book.librarian_id = row[5]
      book.save
    end
  end

end
