class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :card_number, limit: 19
      t.string :card_duedate
      t.string :cvc
      t.integer :status, default: 0
      t.string :brand
      #t.string :type
      t.string :scheme
      t.string :bank_name
      #t.string :bank_city
      t.string :country_name

      t.timestamps
    end
  end
end
