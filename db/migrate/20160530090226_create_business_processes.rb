class CreateBusinessProcesses < ActiveRecord::Migration[5.0]
  def change
    create_table :business_processes do |t|
      t.string :description
      t.integer :author_id
      t.integer :route_id
      t.boolean :executed
      t.datetime :execution_date
      t.integer :file_id

      t.timestamps
    end
  end
end
