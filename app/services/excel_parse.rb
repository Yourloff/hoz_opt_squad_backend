require 'rubyXL'
require 'rubyXL/convenience_methods/font'
require 'rubyXL/convenience_methods/cell'

class ExcelParse
  CATALOG_COLUMN = 3

  def initialize
    @file = open_file('/pricelist.xlsx')
  end

  def call
    data_xlsx
  end

  private

  def open_file(file)
    __dir__ + file
  end

  def data_xlsx
    workbook = RubyXL::Parser.parse(@file)
    worksheet = workbook.worksheets[0]
    #categories = Category.all
    #subcategories = Subcategory.all
    #articles = Product.all.map { |product| product.article_number }

    catalog = ''
    sub_catalog = ''
    data_array = []
    index = 0

    worksheet.drop(15).each do |row|
      array = []
      row && row.cells.each do |cell|
        val = cell&.value

        if row.cells[2].font_size == 14 && row.cells[2].font_color != '000000'
          catalog = val
        elsif row.cells[2].font_size == 9
          sub_catalog = val
        elsif row.cells[2].font_size == 8

          article = row.cells[1].value
          product = row.cells[2].value
          price = row.cells[3].value

          array << [catalog, sub_catalog, article, product, price]

          if row.cells[5].value&.downcase == "фото"
            array << worksheet.relationship_container.find_by_rid(worksheet.hyperlinks[index].r_id).target
            index += 1
          end
          data_array << array
          break
        elsif row.cells[2].font_size == 14 && row.cells[2].font_color == '000000'
          pp data_array
          exit
        end
      end
    end
  end
end
