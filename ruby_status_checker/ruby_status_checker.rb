require 'curb'
require 'benchmark'
require 'logger'

class UrlStatusChecker

  def initialize()
      @log = get_logger( [Dir.pwd, 'status_output.csv'].join('/') )
   end

  def curl_test_multi_url(urls_array)
    responses = {}
    m = Curl::Multi.new
    urls_array.each do |url|
      responses[url] = ""
      c = Curl::Easy.new(url) do|curl|
        curl.follow_location = false
        curl.on_complete {|easy| @log.debug "#{easy.response_code}; #{url}" }
      end
      m.add(c)
    end
    m.perform do end;
  end

  private

  def get_logger(output_file)
    begin
      log = Logger.new(output_file)
      log.formatter = proc do |severity, datetime, progname, msg|
      "#{datetime.strftime('%Y-%m-%d %H:%M:%S:%L %z')}; #{msg}\n"
    end
    log
    rescue Exception => e
      puts "Unable to create #{output_file}. execution ended..."
      false
    end
  end

end

time = Benchmark.measure do
  checker = UrlStatusChecker.new
  urls_array = [
      'https://www.bbc.com/future/article/20200903-the-wind-turbines-standing-up-to-the-worlds-worst-storms',
      'https://www.cnn.com/2020/09/03/football/brazil-equal-pay-women-football-spt-intl/index.html',
      'https://www.aljazeera.com/ajimpact/saudi-giant-sells-middle-east-biggest-company-bond-2020-200903135745849.html'
  ]

  checker.curl_test_multi_url(urls_array)
end
puts "Total execution: #{time.real}"

