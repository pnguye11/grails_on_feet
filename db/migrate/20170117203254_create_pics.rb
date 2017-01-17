class CreatePics < ActiveRecord::Migration[5.0]
  def change
    create_table :pics do |t|
      t.string :title
      t.string :string
      t.string :description
      t.string :text

      t.timestamps
    end
  end
end
