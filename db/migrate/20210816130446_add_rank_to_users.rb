class AddRankToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :rank, :string, default: "Noob"
  end
end
