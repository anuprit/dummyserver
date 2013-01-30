class FixColumnNameInParamter < ActiveRecord::Migration
  def up
  	rename_column :parameters, :type, :param_type
  end

  def down
  end
end
