class AddConfirmationFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.datetime :confirmed_at
      t.string :confirmation_token
      end
    end
  end
