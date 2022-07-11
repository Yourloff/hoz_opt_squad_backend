require 'rubyXL'
require 'rubyXL/convenience_methods/font'
require 'rubyXL/convenience_methods/cell'

class ExcelParse
  CATALOG_COLUMN = 3

  def initialize
    @file = open_file('/pricelist.xlsx')
  end

  def call
    read_data_xlsx
  end

  private

  def open_file(file)
    __dir__ + file
  end

  def read_data_xlsx
    workbook = RubyXL::Parser.parse(@file)
    worksheet = workbook.worksheets[0]

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
          return data_array
        end
      end
    end
  end

  def writing_data
    read_data_xlsx

    Category.all.each do |category|
      category.subcategories
    end

    articles = Product.all.map { |product| product.article_number }
  end
end

ExcelParse.new.call
