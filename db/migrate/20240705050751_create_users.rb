class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :role, default: 0
      t.string :password_digest
      t.string :password_confirmation
      t.string :otp_secret_key
      t.integer :otp_code_attempts
      t.datetime :otp_code_expires_at
      t.string :otp_code
      t.boolean :provider, default: false

      t.timestamps
    end
  end
end
