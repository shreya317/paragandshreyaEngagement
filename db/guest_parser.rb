def parse_guest_login
  Spreadsheet.client_encoding = 'UTF-8'
  @workbook = Spreadsheet.open("../../../desktop/guestLogin.xls")

  # Get the first worksheet in the Excel file
  @worksheet = @workbook.worksheet(0)

  # It can be a little tricky looping through the rows since the variable
  # @worksheet.rows often seem to be empty, but this will work:
  1.upto @worksheet.last_row_index do |index|
    # .row(index) will return the row which is a subclass of Array
    row = @worksheet.row(index)

    @guest = Guest.new
    #row[0] is the first cell in the current row, row[1] is the second cell, etc...
    @guest.first_name = row[0]
    @guest.last_name = row[1]
    @guest.zip_code = row[2].to_i.to_s

    @guest.save
  end
end