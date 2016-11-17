class AddSubmissionToDiscussions < ActiveRecord::Migration
  def change
    add_reference :discussions, :submission, index: true, foreign_key: true
  end
end
