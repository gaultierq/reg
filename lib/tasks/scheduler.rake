require 'date'
task :see_events => :environment do
  Event.where(seen: false).each do |event|
    event.seen = true
    event.save
  end
end