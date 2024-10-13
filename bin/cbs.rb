require 'bundler/setup'
require 'nokogiri'
require 'date'
require 'csv'

original_file = ARGV[0]

TYPES = {
  Credit: 'in',
  Debit: 'out'
}.freeze

headers = %w[uid date amount type reason]

xml = Nokogiri::XML(File.open(original_file))

formatted = xml.xpath('//AccountMovement').map do |movement|
  type = TYPES[movement.xpath('./MovementType').first.text.to_sym]

  {
    account: movement.xpath('./Account/ShortName').first.text,
    uid: [movement.xpath('./DocumentReference').first.text, type].join('-'),
    date: Date.parse(movement.xpath('./ValueDate').first.text),
    amount: movement.xpath('./Amount').first.text,
    type:,
    reason: [
      movement.xpath('./Reason').first.text,
      movement.xpath('./ReasonI02').first.text,
      movement.xpath('./Narrative').first.text,
      movement.xpath('./NarrativeI02').first.text
    ].reject(&:empty?).join(' / ')
  }
end

files = formatted.each_with_object({}) do |row, hsh|
  hsh[row[:account]] = [] unless hsh[row[:account]]
  hsh[row[:account]] << row
end

files.each do |account, operations|
  new_file = "#{Date.today.to_s.gsub('-', '')}_#{account}_mercury.csv"

  csv_string = CSV.generate(headers: true) do |csv|
    csv << headers

    operations.each do |row|
      csv << {
        'uid' => row[:uid],
        'date' => row[:date],
        'type' => row[:type],
        'reason' => row[:reason],
        'amount' => row[:amount]
      }
    end
  end

  File.open(new_file, 'w') do |f|
    f.write(csv_string)
  end
end
