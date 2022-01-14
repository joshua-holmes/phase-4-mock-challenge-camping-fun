class ChangeTimeInSignups < ActiveRecord::Migration[6.1]
  def change
    change_column :signups, :time, :integer
  end
end
