class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      # also as 
      # t.column :title, :string
      t.text :description
      t.string :image_url
      t.decimal :price, precision: 8, scale: 2

      t.timestamps null: false
      
      # same as 
      # t.datetime :created_at, null: false
      # t.datetime :updated_at, null: false
    end
  end
end

# generally:

# create_table :table do |t|
#   t.column :name, :type, options
#   t.type :name, options
# end

# Table column types

# binary
# boolean
# date
# datetime
# decimal
# float
# integer
# string
# text
# time


# Table column options

# limit: size
# default: value
# null: true/false

# precision: number
# scale: number