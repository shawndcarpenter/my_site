class AddHostIdToViewerParties < ActiveRecord::Migration[7.1]
  def change
    add_column :viewer_parties, :host_id, :integer
  end
end
