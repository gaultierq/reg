class AddSeenToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :seen, :boolean
  end
end
