class CreatePostLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :post_likes do |t|
      t.belongs_to :post
      t.belongs_to :user

      t.timestamps
    end
  end
end
