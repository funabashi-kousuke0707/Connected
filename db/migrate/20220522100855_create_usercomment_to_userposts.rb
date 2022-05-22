class CreateUsercommentToUserposts < ActiveRecord::Migration[6.1]
  def change
    create_table :usercomment_to_userposts do |t|

      t.timestamps
    end
  end
end
