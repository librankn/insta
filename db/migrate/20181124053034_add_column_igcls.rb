class AddColumnIgcls < ActiveRecord::Migration[5.1]
  def change
    add_column :igcls, :image, :text
  end
end
