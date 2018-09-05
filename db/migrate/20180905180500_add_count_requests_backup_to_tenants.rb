class AddCountRequestsBackupToTenants < ActiveRecord::Migration[5.2]
  def change
    add_column :tenants, :count_requests_backup, :string
  end
end
