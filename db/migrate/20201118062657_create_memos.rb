class DeleteRocords < ActiveRecord::Migration[5.1]
  def change
    drop_table :memos
  end
end