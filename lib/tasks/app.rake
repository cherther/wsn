namespace :app do
  
  desc "Populate Test db"

  task :populate => :environment do
    
    tables = ["users", "roles", "contacts", "privileges", "subscriptions", "catalogs", "contents", "contents_tags", "media", "representations", 
      "territories", "representations_territories", "plan_balances", "pricing_plans", "site_profiles", "tags" ]

    ActiveRecord::Base.establish_connection

    tables.each do |t|
      
      sql = "truncate table wsn_test.#{t};"
      puts sql
      ActiveRecord::Base.connection.execute(sql)
      sql = "insert into wsn_test.#{t} select * from wsn_dev.#{t};"
      puts sql
      ActiveRecord::Base.connection.execute(sql)

    end  
    
    ActiveRecord::Base.clear_active_connections!

  end
  
end