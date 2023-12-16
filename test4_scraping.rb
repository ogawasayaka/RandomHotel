require "selenium-webdriver"
require 'csv'

#bomの宣言
bom = %w(EF BB BF).map { |e| e.hex.chr }.join
csv_file = CSV.generate(bom) do |csv|
  csv << ["No", "name", "city","name_url" "review_url"]
end

File.open("result2.csv", "w") do |file|
  file.write(csv_file)
end
# ブラウザの起動
driver = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(timeout: 30) # 最大30秒待つ

begin
  # ページへのアクセス
  driver.get "https://travel.rakuten.co.jp/review/"
  element = driver.find_element(:id, 'searchBox')
  element.send_keys('看板猫 温泉')
  driver.find_element(:id, 'searchSubmit').click
  driver.find_element(:xpath, '//*[@id="result"]/div[32]/ul/li[1]/a[2]').click



  urls = []
  narrow_section = wait.until { driver.find_element(:id, 'result') }
  
  narrow_section.find_elements(:class, 'more').each do |list_item|
    link = list_item.find_element(:tag_name, 'a')
    urls << link.attribute('href') # href属性の値を取得して配列に追加
  end
  
  data = []
urls.each_with_index do |url, index|
  begin
    driver.get(url)
    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    wait.until { driver.find_element(:id, 'RthNameArea') }
    name_element = driver.find_element(:id, 'RthNameArea')
    name = name_element.text

    city_element = driver.find_element(:xpath, '//*[@id="breadcrumbs-middle"]/span')
    city = city_element.text

    name_url_element = driver.find_element(:tag_name, 'h2').find_element(:tag_name, 'a')
    name_url = name_url_element.attribute("href")

    
    data << [name, city, name_url, url]
    rescue Selenium::WebDriver::Error::TimeoutError
      puts "#{url} の読み込み中にタイムアウトしました。"
    end

    CSV.open("result.csv", "a") do |file|
      file << [index + 253, name, city, name_url, url]
    end
  end

end

