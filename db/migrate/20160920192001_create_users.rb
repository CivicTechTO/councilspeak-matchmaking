class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :organization
      t.string :postal_address
      t.string :phone
      t.string :email
      t.boolean :is_presenter

      t.timestamps
    end
  end
end
