class AddIpAddressToVotingSessions < ActiveRecord::Migration
  def change
    add_column :voting_sessions, :ip_address, :string
  end
end
