*** Settings ***
Library  Selenium2Library
Library  OperatingSystem

*** Keywords ****
Set Environment Variable  webdriver.gecko.driver  /usr/bin/geckodriver

*** Variables ***
${BROWSER}    ff

*** Testcases ***
Hello
    Open Browser    http://www.google.com   browser=${BROWSER}
