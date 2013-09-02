Given /^the following articles exists:$/ do |table|
    table.map_headers!( "Author" => :author, "Title" => :title, "Body" => :body)
    table.hashes.each do |article_params|
        FactoryGirl.create(:article, article_params)
    end
end

When /^I merge article "([^"]*)" with article "([^"]*)"$/ do | current, with |
    step "I am on the edit page for \"#{current}\""
    step "I fill in \"Article ID\" with \"#{Article.find_by_title(with).id}\""
    step "I press \"Merge With This Article\""
end

Then /^there should not be article "([^"]*)"$/ do |article|
    step "I am on the All Articles page"
    step "I should not see \"#{article}\""
end

Then /^author of article "(.*?)" should be "(.*?)"$/ do |title,author|
    Article.find_by_title(title).author.should == author
end

Then /^title of article "(.*?)" should be "(.*?)"$/ do |title, real_title|
    Article.find_by_title(title).title.should == real_title
end

Then /^body of article "(.*?)" should contain "(.*?)"$/ do |title, text|
    Article.find_by_title(title).body.should =~ /#{text}/
end

Given /^"(.*?)" article have (\d+) comments$/ do |title, num|
    article=Article.find_by_title(title)
    num.to_i.times do
        FactoryGirl.create(:comment, :article => article)
    end
end

Then /^"(.*?)" article should have (\d+) comments$/ do |title, num|
   article=Article.find_by_title(title) 
   article.comments.count.should == num.to_i
end
