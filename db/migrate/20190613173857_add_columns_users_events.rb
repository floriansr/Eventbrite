class AddColumnsUsersEvents < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :is_admin, :boolean
  	add_column :events, :validated, :boolean
  end
end
