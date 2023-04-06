class AddAdminCategoryToAdminEvents < ActiveRecord::Migration[7.0]
  def change
    add_reference :admin_events, :admin_category, null: false, foreign_key: true
  end
end
