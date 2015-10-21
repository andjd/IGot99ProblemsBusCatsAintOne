class AddForeignKeyConstraints < ActiveRecord::Migration
  def change
    add_foreign_key :cat_rental_requests, :users
    add_foreign_key :cats, :users
  end
end
