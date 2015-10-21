class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, presence: true, index: true, unique: true
      t.string :password_digest, presence: true, index: true
      t.string :session_token, presence: true, unique: true, index: true

      t.timestamps
    end
  end
end
