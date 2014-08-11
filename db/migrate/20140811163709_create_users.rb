class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :digest
      t.string :salt

      t.timestamps
    end
  end
end
