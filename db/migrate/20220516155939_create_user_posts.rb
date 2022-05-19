class CreateUserPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :user_posts do |t|
      t.string     :text
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
