class CreateWorkTypes < ActiveRecord::Migration
  def change
    create_table :work_types do |t|
      t.string :description
	  
	  t.belongs_to :billing_unit
      t.timestamps
    end
  end
end
