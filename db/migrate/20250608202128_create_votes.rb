class CreateVotes < ActiveRecord::Migration[8.0]
  def change
    create_table :votes do |t|
      t.references :option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
