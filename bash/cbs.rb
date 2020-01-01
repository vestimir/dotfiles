require 'csv'
require 'date'

# MAPPING
# 0: Сметка
# 1: Дата на обработка
# 2: Референция
# 3: Вальор!
# 4: Сума във валута на сметката!
# 5: Сума във валута на операцията
# 6: Обменен курс
# 7: Тип!
# 8: Описание на операцията!
# 9: Основание за плащане!
# 10: Още пояснения!

original_file = ARGV[0]
new_file = original_file.gsub('.csv', '_mercury.csv')
headers = %w[date amount type reason]

def type(row)
  case row[7] # row['Тип']
  when 'КТ' then 'in'
  when 'ДТ' then 'out'
  end
end

def parse_date(row)
  date = row[3]  # row['Вальор']

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
      'date' => parse_date(row),
      'type' => type(row),
      'reason' => [row[8], row[9], row[10]].reject(&:nil?).join(' / '), # row['Описание на операцията'],
      'amount' => row[4] # row['Сума във валута на сметката']
    }
  end
end

File.open(new_file, 'w') do |f|
  f.write(csv_string)
end
