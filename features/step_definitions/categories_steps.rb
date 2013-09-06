Given /^the following categories exists:$/ do |table|
    table.map_headers!( "Name" => :name)
    table.hashes.each do |category_params|
        FactoryGirl.create(:category, category_params)
    end
end
