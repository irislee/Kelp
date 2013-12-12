Given(/^I have activities The Art Farm in the City, Ice Festival$/) do
  visit '/'
end

When(/^I go to the list of activities$/) do
  visit '/'
end

Then(/^I should see "(.*?)"$/) do |arg1|
  arg1
end