class CreateGuardados < ActiveRecord::Migration[5.2]
  def change
    create_table :guardados do |t|
      t.integer :user_id
      t.integer :article_id
    end
  end
end
