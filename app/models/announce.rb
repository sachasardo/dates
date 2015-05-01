class Announce < ActiveRecord::Base
  validates_presence_of :name, :text

  acts_as_votable

  def self.good_dates
    all.where("good = true")
  end
  def self.bad_dates
    all.where("good = false")
  end
end
