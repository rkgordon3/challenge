class CreateChallengers < ActiveRecord::Migration
  def change
    create_table :challengers do |t|
      t.string :name
      t.string :email
      t.boolean :in

      t.timestamps
    end
  end
end
