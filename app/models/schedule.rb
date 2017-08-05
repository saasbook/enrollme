class Schedule < ActiveRecord::Base
  belongs_to :user

  @@feature_cols = [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]
  def toArray
    return @@feature_cols.map {|col_name| self[col_name]}
  end

  def toString
    return (@@feature_cols.select {|day| self[day] == 1}).map {|str| str.capitalize}.join(', ')
  end

  def self.feature_cols
    return @@feature_cols
  end
end
