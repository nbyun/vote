class HardWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'default', retry: false

  def perform(*args)
    puts "======================="
  end
end
