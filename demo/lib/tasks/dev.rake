namespace :dev do
	desc "重建假資料"
	task :rebuild => ["db:reset", :fake]
	task :fake do
		50.times do
			Event.create(:name => Faker::Name.name , :description=> Faker::Lorem.paragraph ,:capacity => (1..1000).to_a.sample)
		end
		puts "finish"
	end
end