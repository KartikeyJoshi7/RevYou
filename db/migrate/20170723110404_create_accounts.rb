class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :firstname
      t.string :lastname
      t.string :dob
      t.integer :phone
      t.string :profilepic
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
