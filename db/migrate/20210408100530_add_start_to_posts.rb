class AddStartToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :start_on, :date
  end
end
