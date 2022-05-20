class CreateUserComments < ActiveRecord::Migration[6.1]
  def change
    create_table :user_comments do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.string     :text
      t.timestamps
    end
  end
end
