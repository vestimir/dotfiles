require 'csv'
require 'date'

# MAPPING
# 0: Сметка
# 1: Дата/Час
# 2: Дата на обработка
# 3: Референция
# 4: Вальор!
# 5: Сума във валута на сметката!
# 6: Сума във валута на операцията
# 7: Обменен курс
# 8: Тип!
# 9: Описание на операцията!
# 10: Основание за плащане!
# 11: Още пояснения!

original_file = ARGV[0]
new_file = original_file.gsub('.csv', '_mercury.csv')
headers = %w[uid date amount type reason]

def type(row)
  case row[8] # row['Тип']
  when 'КТ' then 'in'
  when 'ДТ' then 'out'
  end
end

def parse_date(row)
  date = row[4]  # row['Вальор']

  month_map = {
    '.01.' => ' January ',
    '.02.' => ' February ',
    '.03.' => ' March ',
    '.04.' => ' April ',
    '.05.' => ' May ',
    '.06.' => ' June ',
    '.07.' => ' July ',
    '.08.' => ' August ',
    '.09.' => ' September ',
    '.10.' => ' October ',
    '.11.' => ' November ',
    '.12.' => ' December ',
  }

  month_map.each do |om, nm|
    date = date.gsub(om, nm)
  end

  Date.parse(date).iso8601
end

csv_string = CSV.generate(headers: true) do |csv|
  csv << headers

  CSV.foreach(original_file, col_sep: ',', headers: true) do |row|
    csv << {
      'uid' => "#{row[3]}-#{type(row)}",
      'date' => parse_date(row),
      'type' => type(row),
      'reason' => [row[9], row[10], row[11]].reject(&:nil?).join(' / '), # row['Описание на операцията'],
      'amount' => row[5] # row['Сума във валута на сметката']
    }
  end
end

File.open(new_file, 'w') do |f|
  f.write(csv_string)
end
