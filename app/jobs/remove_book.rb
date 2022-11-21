class RemoveBook
  include Sidekiq::Job

  def perform
    @book = Book.only_deleted.first.destroy
  end

end