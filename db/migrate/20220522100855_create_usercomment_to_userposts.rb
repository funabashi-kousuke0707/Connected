class CreateUsercommentToUserposts < ActiveRecord::Migration[6.1]
  def change
    create_table :usercomment_to_userposts do |t|
      t.string :name
      t.text :text
      t.references :user_post, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
