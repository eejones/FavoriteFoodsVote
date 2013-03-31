class CreateFooditems < ActiveRecord::Migration
  def change
    create_table :fooditems do |t|
      t.string :name
      t.integer :score
      t.integer :totalvotes

      t.timestamps
    end
  end
end
