class AddActionToUserActivityLogs < ActiveRecord::Migration[7.0]
  def change
    add_column :user_activity_logs, :action, :string
  end
end
