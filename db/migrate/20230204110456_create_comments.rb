class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :rating
      t.references :user, null: false, foreign_key: true
      t.references :place, null: false, foreign_key: true

      t.timestamps
    end
  end
end
