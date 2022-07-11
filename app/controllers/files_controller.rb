class FilesController < ApplicationController
  def upload_pricelist
    ExcelParse.new
  end
end