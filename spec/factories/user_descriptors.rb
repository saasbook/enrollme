FactoryGirl.define do
  factory :schedule do
    monday 1
    tuesday 1
    wednesday 1
    thursday 1
    friday 1
    saturday 1
    sunday 1
  end

  factory :skill_set do
    ruby_on_rails 1
    other_backend 0
    frontend 0
    ui_design 0
    team_management 0
  end
end