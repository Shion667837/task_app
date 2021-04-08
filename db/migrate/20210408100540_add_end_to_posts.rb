class AddEndToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :end_on, :date
  end
end
