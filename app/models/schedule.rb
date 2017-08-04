class Schedule < ActiveRecord::Base
  belongs_to :user

  @@feature_cols = [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]
  def toArray
    return @@feature_cols.map {|col_name| self[col_name]}
  end
end
