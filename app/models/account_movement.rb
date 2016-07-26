class AccountMovement < ActiveRecord::Base
  require 'csv'

  belongs_to :account
  validates :concept, presence: true

  default_scope { order('movement_date DESC') }

  def self.import(account, uploaded_file)
    file = uploaded_file.tempfile
    filename = uploaded_file.original_filename
    if filename.end_with?('.csv')
      CSV.foreach(file, headers: true) do |row|
        movement_hash = row.to_hash
        AccountMovement.create!(movement_hash.merge(:account => account))
      end
    elsif filename.end_with?('.xls') || filename.end_with?('.xlsx')
      spreadsheet = Roo::Excelx.new(uploaded_file.path)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        movement_hash = Hash[[header, spreadsheet.row(i)].transpose]
        AccountMovement.create!(movement_hash.merge(:account => account))
      end
    else
      raise 'Unknown file format'
    end
  end

end
