class CreateGuestcommentToUserposts < ActiveRecord::Migration[6.1]
  def change
    create_table :guestcomment_to_userposts do |t|
      t.string     :text
      t.string     :name
      t.references :user_post, foreign_key: true
      t.timestamps
    end
  end
end
