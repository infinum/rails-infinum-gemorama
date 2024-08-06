class CreateVersions < ActiveRecord::Migration[4.2]
  def change
    create_table :versions do |table|
      table.string :authors
      table.text :description
      table.integer :downloads, default: 0
      table.string :number
      table.integer :rubygem_id
      table.integer :position, index: true
      table.timestamps
    end
  end
end
