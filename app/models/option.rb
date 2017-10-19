class Option < ActiveRecord::Base
  before_create :confirm_singleton!
  validates :minimum_team_size, :numericality =>
    {:greater_than => 0, :only_integer => true}
  validates :maximum_team_size, :numericality =>
    {:greater_than => 0, :only_integer => true}
  validate :max_team_size_greater_than_min

  class IsSingletonError < RuntimeError;  end

  private

  def confirm_singleton!
    raise Option::IsSingletonError.new("There can be only one set of options.") if
      Option.count > 0
  end

  def max_team_size_greater_than_min
    errors.add(:maximum_team_size, "cannot be less than minimum team size") if
      maximum_team_size < minimum_team_size
  end

  public

  # shortcut: make getters operate on the first (only) instance of model, eg
  # Option.minimum_team_size instead of Option.first.minimum_team_size
  def self.method_missing(name,*args,&block)
    if Option.column_names.include?(name.to_s)
      first.send(name,*args)
    else
      super
    end
  end

end
