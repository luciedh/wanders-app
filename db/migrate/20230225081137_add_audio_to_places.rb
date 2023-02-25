class AddAudioToPlaces < ActiveRecord::Migration[7.0]
  def change
    add_column :places, :audio_file, :string
  end
end
