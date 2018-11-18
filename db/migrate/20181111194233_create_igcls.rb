class CreateIgcls < ActiveRecord::Migration[5.1]
  def change
    create_table :igcls do |t|
      t.string:title
      t.string:content
    end
  end
end
