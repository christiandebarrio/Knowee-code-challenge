class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.date :incorporation_date
      t.boolean :unsubscribe

      t.timestamps null: false
    end
  end
end
