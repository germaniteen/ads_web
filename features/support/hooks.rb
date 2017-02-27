include ReportHelper

Before do |scenario|
  @scenario = scenario
  initialize_scenario
end

After do |scenario|
  if scenario.failed?
    begin
      add_failed_logs(scenario)
    rescue Exception => e
      puts "Cannot get the report due to #{e}"
    end
  end
  scenario_teardown
end

def initialize_scenario
  case ENV['BROWSERSTACK']
    when 'YES' then
      caps = Selenium::WebDriver::Remote::Capabilities.new
      caps['browser'] = 'Chrome'
      caps['browser_version'] = '56.0'
      caps['os'] = 'OS X'
      caps['os_version'] = 'Sierra'
      caps['resolution'] = '1024x768'
      caps['browserstack.debug'] = 'true'
      @browser = Watir::Browser.new(:remote,
                                    :url => "http://nguyentrungthanh1:zghteG8yfRcxy6c5J4Zs@hub-cloud.browserstack.com/wd/hub",
                                    :desired_capabilities => caps)
    else
      @browser ||= Watir::Browser.new :chrome
      @browser.goto('about:blank')
      @browser.cookies.clear
  end

end

def scenario_teardown
  @browser.close
end