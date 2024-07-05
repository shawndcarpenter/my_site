class AddHostToViewerParties < ActiveRecord::Migration[7.1]
  def change
    add_column :viewer_parties, :host, :boolean, default: true
  end
end
