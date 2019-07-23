# OOP Image Blur 1 Challenge
# Author: Chris Howle

class Image

  attr_reader :img

  def initialize(array)
    @img=array
  end

  def output_image
      @img.each do |i|
        i.each do |j|
          # Use print instead of puts to avoid the new line after each element
          print j
        end
        # After each row, start a new line
        puts "\n"
      end
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image