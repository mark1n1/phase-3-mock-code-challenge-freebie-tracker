class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  def received_one(item_name)
    self.freebies.find_by(item_name: item_name) ? true : false
  end

  def give_away(dev, freebie)
    freebie = self.freebies.find_by(item_name: freebie.item_name)
    if freebie != nil
      freebie.update(dev: dev)
    end
  end
end
