require 'appium_lib'
require 'cucumber'
require 'yaml'

app_name = ENV['APPLICATION_NAME'] || (File.join(File.dirname(__FILE__), "getir-qa-case-study.apk"))

desired_caps = {
    caps: {
        platformName: "Android",
        deviceName: "AnyName",
        app: app_name,
        appPackage: "com.getir.getirtestingcasestudy",
        appActivity: "com.getir.getirtestingcasestudy.ui.login.LoginActivity",
        newCommandTimeout: "10000",
        gpsEnabled: true,
        skipUnlock: true,
        automationName: "UiAutomator2"
    }
}

class AppiumWorld
end

$driver = Appium::Driver.new(desired_caps, true)

Appium.promote_appium_methods AppiumWorld

World do
  AppiumWorld.new
end

Before do
  $driver.start_driver
end

After do
  $driver.driver_quit
end