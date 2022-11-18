class TaskLoggerJob < ApplicationJob
  def perform
    puts "it is  working"
  end
end
