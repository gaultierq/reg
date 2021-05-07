
```
./bin/bundle install
yarn
./bin/bundle exec rake db:create db:migrate
./bin/bundle exec rake db:seed
./bin/rails server
```

## how to deploy prod
```
mv data ../
git pull
docker-compose build app
docker-compose up
```
