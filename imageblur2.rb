class Image

  def initialize (pictures)
    @pictures = pictures
  end

  def one_coordinates
      one_coordinates = []
      @pictures.each_with_index do |row, row_number|
        row.each_with_index do |picture, col_number|
          if picture == 1
            one_coordinates << [row_number, col_number]
          end
         end
       end
      one_coordinates
  end

    def blurrify
      ones = one_coordinates
        @pictures.each_with_index do |row, row_number|
          row.each_with_index do |picture, col_number|
            ones.each do |found_row_number, found_col_number|

              if row_number == found_row_number && col_number == found_col_number
                @pictures[row_number][col_number -1] = 1 unless col_number == 0
                @pictures[row_number][col_number +1] = 1 unless col_number == 3
                @pictures[row_number -1][col_number] = 1 unless row_number == 0
                @pictures[row_number +1][col_number] = 1 unless row_number == 3
              end
             end
           end
         end
    end

    def output_image
      @pictures.each do |array|
        puts array.join
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
puts
image.blurrify

image.output_image