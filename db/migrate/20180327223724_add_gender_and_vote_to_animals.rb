class AddGenderAndVoteToAnimals < ActiveRecord::Migration[5.1]
  def change
    add_column :animals, :gender, :string
    add_column :animals, :vote, :integer
  end
end
