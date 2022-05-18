class CreateCats < ActiveRecord::Migration[6.1]
  def change
    create_table :cats do |t|
      t.string :title
      t.string :slug

      t.timestamps
    end
  end
end
