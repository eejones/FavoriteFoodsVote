class CreateVoters < ActiveRecord::Migration
  def change
    create_table :voters do |t|
      t.string :user_id
      t.boolean :value
      t.references :fooditem

      t.timestamps
    end
    add_index :voters, :fooditem_id
  end
end
