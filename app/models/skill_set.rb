class SkillSet < ActiveRecord::Base
  belongs_to :user
  @@feature_cols = [:ruby_on_rails, :other_backend, :frontend, :ui_design, :team_management]
  def toArray
    return @@feature_cols.map {|col_name| self[col_name]}
  end

  def toString
    return (@@feature_cols.select {|skill| self[skill] == 1}).join(', ').gsub('_', ' ').titleize
  end

  def feature_cols
    return @@feature_cols
  end
end