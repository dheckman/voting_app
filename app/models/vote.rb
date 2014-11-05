class Vote < ActiveRecord::Base
  belongs_to :voter
  belongs_to :candidate

  validates :voter, presence: true, uniqueness: true
  validates :candidate, presence: true


end
