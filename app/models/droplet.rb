# == Schema Information
#
# Table name: droplets
#
#  id                  :integer          not null, primary key
#  remote_id           :integer
#  remote_size_id      :integer
#  remote_region_id    :integer
#  ip_address          :inet
#  remote_status       :string(255)
#  last_synced         :datetime
#  created_at          :datetime
#  updated_at          :datetime
#  minecraft_server_id :uuid
#

class Droplet < ActiveRecord::Base
  belongs_to :minecraft_server

  def remote
    return DigitalOcean::Droplet.new(self)
  end

  def host_name
    return "gamocosm-minecraft-#{minecraft_server.name}"
  end
end