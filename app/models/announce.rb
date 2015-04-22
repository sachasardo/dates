class Announce < ActiveRecord::Base
  validates_presence_of :name, :text
  def self.good_dates
    all.where("good = true")
  end
  def self.bad_dates
    all.where("good = false")
  end
end
