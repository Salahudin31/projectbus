class CreateRutes < ActiveRecord::Migration[5.2]
  def change
    create_table :rutes do |t|
      t.string :strat
      t.string :end

      t.timestamps
    end
  end
end
