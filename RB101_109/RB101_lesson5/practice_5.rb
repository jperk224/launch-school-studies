# given this nested hash, figure out
# the toal age of just the male family members

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

male_munsters = munsters.select do |munster, demographics|
  demographics["gender"] == "male"
end

male_age_total = 0
male_munsters.each do |munster, demographics|
  male_age_total += demographics["age"]
end

p male_age_total

## Solution approach ###

total_male_ages = 0
munsters.each_value do |value|
  total_male_ages += value["age"] if value["gender"] == "male"
end

p total_male_ages
