# namespace :aws do
#     desc "This rake builds and deploys the app using aws-rails-provisioner"

#     task :build do
#       sh "aws-rails-provisioner build"
#     end
#     task :deploy do
#       sh "aws-rails-provisioner deploy"
#     end
#   end

namespace :ddb do
  desc 'Starts dynamodb local'
  task :local do
    sh 'docker run -p 8000:8000 dwmkerr/dynamodb -sharedDb'
  end

  desc 'Builds single table'
  task :up do
    require_relative '../../app/models/spoon'

    local_client = Aws::DynamoDB::Client.new(region: 'local', endpoint: 'http://localhost:8000')

    Spoon.configure_client(client: local_client)

    migration = Aws::Record::TableMigration.new(Spoon, client: local_client)

    migration.create!(
      # billing_mode: "PAY_PER_REQUEST" # possible with these migrations
      provisioned_throughput: {
        read_capacity_units: 5,
        write_capacity_units: 2
      }
    )
    migration.wait_until_available
  end

  desc 'Destroys table and dynamo local running instance, but also kills all other docker containers.'
  task :down do
    sh 'docker kill $(docker ps -q)'
  end
end
