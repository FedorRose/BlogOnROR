class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :subtitle
      t.text :text
      t.boolean :publish
      t.string :image_uid

      t.timestamps
    end
  end
end
