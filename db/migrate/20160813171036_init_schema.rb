class InitSchema < ActiveRecord::Migration
  def change
    create_table :users do |t|
      #for admin
      t.boolean :admin, null: false, default: false

      #user information
      t.string :user_name, null: false, uniquness: true
      t.string :email, null: false, uniquness: true
      t.integer :gender, null: false
      t.integer :undergraduate, null: false
      t.integer :department, null: false

      #user security
      t.string :password_digest, null: false
      t.string :remember_digest
      t.string :reset_digest
      t.datetime :reset_sent_at

      t.timestamps null: false
    end

    create_table :share_groups  do |t|
      t.string :group_name, null: false
      t.timestamps null: false
    end

    create_table :lectures do |t|
      t.string :title, null: false
      t.string :professor_name, null: false, index: true
      t.integer :weekday, null: false
      t.integer :unit_count, null: false
      t.integer :period, null: false
      t.boolean :is_required_for_graduation?, null: false, default: true
      t.integer :lecture_category, null: false #パンキョーか、語学か、選択必修かなどのカテゴリわけ
      t.timestamps null: false
    end

    create_table :assignments do |t|
      t.belongs_to :lecture, null: false, index: true
      t.date :due_date, null: false
      t.string :title, null: false
      t.string :image
      t.timestamps null: false
    end

    add_foreign_key :assignments, :lectures, on_delete: :cascade

    create_table :comments do |t|
      t.belongs_to :user, null: false, index: true
      t.text :content, null: false
      t.string :image
      t.integer :assignment_id, null: false, index: true
      t.integer :user_id, null: false, index:true
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end

    #Middle table

    create_table :share_group_users do |t|
      t.belongs_to :user, null: false, index: true
      t.belongs_to :share_group, null: false, index: true
    end

    create_table :lecture_share_groups do |t|
      t.belongs_to :share_group, null: false
      t.belongs_to :lecture, null: false
    end

    # for bootsy
    create_table :bootsy_image_galleries do |t|
      t.references :bootsy_resource, polymorphic: true
      t.timestamps
    end

    create_table :bootsy_images do |t|
      t.string :image_file
      t.references :image_gallery
      t.timestamps
    end

  end
end
