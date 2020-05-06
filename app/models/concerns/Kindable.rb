module Kindable

  # => Load
  # => Triggered whenever module is invoked (allows us to populate response data)
  # => #<Method: ActiveRecord::Relation#load(&block) c:/Dev/Apps/pwinty-integration/.bundle/ruby/2.7.0/gems/activerecord-6.0.2.1/lib/active_record/relation.rb:614>
  def load(&block)

    unless loaded?
      exec_queries do |record|
        record.assign_attributes({kind: items[record.id]}) if items[record.id].present?
      end
    end

  end

  def <<(attachments)
    join = proxy_association.reflection.source_reflection
    owner = proxy_association.reflection.through_reflection

    ActiveRecord::Base.transaction do
      attachments.each do |attachment|
        attachment.save!
        join.active_record.create!(join.foreign_key.to_sym => attachment.id,
                                   owner.foreign_key.to_sym => proxy_association.owner.id,
                                   :kind => attachment.kind)
    end



    end
  end

  # Load
  # Deprecated with AR 6.0
  #def load
  #   amounts.each do |amount|
  #       proxy_association.target << amount
  #   end
  #end

  #Private
  private

  #Amounts
  # Not needed after AR 6.0
  #def amounts
  #   return_array = []
  #   through_collection.each_with_index do |through,i|
  #       associate = through.send(reflection_name)
  #       associate.assign_attributes({amount: items[i]}) if items[i].present?
  #       return_array.concat Array.new(1).fill( associate )
  #   end
  #   return_array
  #end

  #######################
  #      Variables      #
  #######################

  #Association
  def reflection_name
    proxy_association.source_reflection.name
  end

  #Foreign Key
  def through_source_key
    proxy_association.reflection.source_reflection.foreign_key
  end

  #Primary Key
  def through_primary_key
    proxy_association.reflection.through_reflection.active_record_primary_key
  end

  #Through Name
  def through_name
    proxy_association.reflection.through_reflection.name
  end

  #Through
  def through_collection
    proxy_association.owner.send through_name
  end

  #Captions
  def items
    #through_collection.map(&:amount)
    through_collection.pluck(through_source_key, :kind).map{ |id, kind| { id => kind } }.inject(:merge) #-> { id: record, id: record }
  end

  #Target
  # This no longer works with AR 6.0+
  #def target_collection
  #   #load_target
  #   proxy_association.target
  #end

end