class AddLockableOnAdmin < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :failed_attempts, :integer, default: 0, null: false # Only if lock strategy is :failed_attempts
    add_column :admins, :locked_at, :datetime

    # Add these only if unlock strategy is :email or :both
    add_column :admins, :unlock_token, :string
    add_index :admins, :unlock_token, unique: true
  end
end
