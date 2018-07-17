class TwoFactorAuthenticationAddToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :second_factor_attempts_count, :integer, default: 0
    add_column :admins, :encrypted_otp_secret_key, :string
    add_column :admins, :encrypted_otp_secret_key_iv, :string
    add_column :admins, :encrypted_otp_secret_key_salt, :string
    add_column :admins, :direct_otp, :string
    add_column :admins, :direct_otp_sent_at, :datetime
    add_column :admins, :totp_timestamp, :timestamp

    add_index :admins, :encrypted_otp_secret_key, unique: true
  end
end
