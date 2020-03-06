class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      create_table :creditcards do |t|
        t.string :name, null: false
        t.string :ancestory
      t.timestamps
    end
  end
end
