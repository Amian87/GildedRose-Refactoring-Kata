require_relative "../lib/gilded_rose"

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it "decreases the quality by 1" do
      items = [Item.new("foo", 1, 60)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 59
    end

    it "an items quality does not decrease below 0" do
      items = [Item.new("foo", 1, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end

    it "Sulfuras doesn't drop in quality" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 1, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 10
    end

    it "should increase the quality of Aged Brie by 1" do
      items = [Item.new("Aged Brie", 1, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 11
    end

    it "should increase the quality of Backstage whn the sell in days is between 6 and 11 " do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 7, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 12
    end


  end

end

