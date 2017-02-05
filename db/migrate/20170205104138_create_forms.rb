class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :title
      t.text :design
      t.timestamps null: false
    end
  end
end
