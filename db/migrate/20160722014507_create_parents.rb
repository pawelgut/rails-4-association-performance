class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.integer :grandparent_id

      t.timestamps null: false
    end
  end
end
