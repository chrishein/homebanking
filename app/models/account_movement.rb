class AccountMovement < ActiveRecord::Base
  require 'csv'

  belongs_to :account
  validates :concept, presence: true

  validates_numericality_of :debit, allow_nil: true
  validates_numericality_of :credit, allow_nil: true
  validates_numericality_of :balance, allow_nil: true

  validate :credit_xor_debit

  default_scope { order('movement_date DESC') }

  THOUSANDS_SEPARATOR = ','.freeze
  NUMERIC_FIELDS = [:credit, :debit, :balance].freeze

  def self.import(account, uploaded_file)
    file = uploaded_file.tempfile
    filename = uploaded_file.original_filename
    if filename.end_with?('.csv')
      CSV.foreach(file, headers: true) do |row|
        movement_hash = row.to_hash
        AccountMovement.create!(prepare_movement(movement_hash, account))
      end
    elsif filename.end_with?('.xls') || filename.end_with?('.xlsx')
      spreadsheet = Roo::Excelx.new(uploaded_file.path)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        movement_hash = Hash[[header, spreadsheet.row(i)].transpose]
        AccountMovement.create!(prepare_movement(movement_hash, account))
      end
    else
      raise 'Unknown file format'
    end
  end

  private

    def self.prepare_movement(movement_hash, account)
      movement_hash = movement_hash.symbolize_keys
      movement_hash[:account] = account
      movement_hash.select { |k, v| NUMERIC_FIELDS.include?(k) }.each do |k, v|
        if !movement_hash[k].nil? && movement_hash[k].is_a?(String)
          movement_hash[k] = movement_hash[k].gsub(THOUSANDS_SEPARATOR, '').to_f
        end
      end

      movement_hash[:movement_date] = Chronic.parse(movement_hash[:movement_date])

      movement_hash
    end

    def credit_xor_debit
      unless credit.blank? ^ debit.blank?
        errors.add(:base, I18n.t('account_movements.create.credit_or_debit_required'))
      end
    end
end
