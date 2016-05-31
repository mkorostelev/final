class AddAuthorIdToRoutes < ActiveRecord::Migration[5.0]
  def change
    add_column :routes, :author_id, :integer
  end
end
