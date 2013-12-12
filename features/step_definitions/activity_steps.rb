Given(/^I have an activity "(.*?)" with the location "(.*?)"$/) do |name, addy|
  Activity.create(:name => name, :location => addy)
  visit '/'
end

Then(/^I should click "(.*?)"$/) do |name|
  click_link "#{name}"
end

Then(/^I should see the address "(.*?)"$/) do |addy|
  expect(page).to have_content addy
end