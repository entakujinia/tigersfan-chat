class DeleteMemos < ActiveRecord::Migration[6.0]
  def change
    drop_table :memos
  end
end
