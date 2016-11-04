class Application < ActiveRecord::Base
   has_one :team
   has_many :discussions
   
end