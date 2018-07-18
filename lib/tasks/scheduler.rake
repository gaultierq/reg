require 'date'
task :see_events => :environment do
  if Date.today.sunday?
    Event.where(seen: false).each do |event|
      event.seen = true
      event.save
    end
  end
end