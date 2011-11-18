require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  
  test "should have an asset attachment and delete it upon destruction" do
    image = Image.new
    File.open('test/data/jpeg450x1436.jpg') { |img| image.asset = img }
    assert_nothing_raised do
      image.save!
    end
    original_path = image.asset.path(:original)
    assert File.exists?(original_path)
    image.destroy
    assert !File.exists?(original_path)
  end
  
end
