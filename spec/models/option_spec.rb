require 'rails_helper'

describe Option do
  it 'is seeded with options' do
    expect(Option.first).to be_a_kind_of Option
  end
  it 'is an error to create another' do
    expect { Option.create(:minimum_team_size => 1, :maximum_team_size => 3) }.
      to raise_error(Option::IsSingletonError)
  end
  it 'allows using class methods to dereference singleton attributes' do
    expect(Option.minimum_team_size).to be_a_kind_of Integer
  end
  it 'requires max team size no less than min' do
    (o = Option.first).update_attributes(:minimum_team_size => 3,:maximum_team_size => 2)
    expect(o.errors.full_messages).to include("Maximum team size cannot be less than minimum team size")
  end
end
