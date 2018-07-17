class SeeEvents < ApplicationJob
  queue_as :default

  def perform
    Event.where(seen: false).each do |event|
      event.seen = true
    end
  end
end