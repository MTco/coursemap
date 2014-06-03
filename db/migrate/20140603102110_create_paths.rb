class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end
