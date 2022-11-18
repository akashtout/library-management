class RemoveBook
  include Sidekiq::Job
  sidekiq_options retry: false

  def perform
    @book = Book.only_deleted.first.destroy
  end

end