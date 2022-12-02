module ExportCsv
  extend ActiveSupport::Concern
  module ClassMethods
    def to_csv
      require 'csv'
      options = { col_sep: ';', encoding: 'utf-8' }
      headers = %i[id title price description author_id author_name librarian_id category_id]

      CSV.generate(headers: true, **options) do |csv|
        csv << headers
        all.each do |book|
          csv << [book.id, book.title, book.price, book.description, book.author_id, book.author_name, book.librarian_id, book.category_id]
        end
      end
    end
  end
end