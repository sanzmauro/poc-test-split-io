# README

This code repo contains no business logic, only serves as a demo to integrate split.io Ruby SDK with Rails.
## How to run this project on your computer

### Dependencies

  - Ruby, here I use version 2.7.5 for an example (can install via a Ruby version manager, recommend `asdf`)
  - Httpie for CLI testing (feel free to use cURL / Postman)
  - run `bundle install` to install Ruby dependencies (split.io Ruby SDK already included)

### Up & running
  - run `SPLIT_IO_API_KEY=xxx rails s` in command line to start a web server process on your computer, replace `xxx` with your server-side split.io API key
  - run `SPLIT_IO_API_KEY=xxx rails c` in command line to start a Rails console process on your computer, replace `xxx` with your server-side split.io API key

### Check 

In command line interface, run `http localhost:3030` to check if the server is running, expecting response `{ "ok": true}`

### Procedures to reproduce this behavior

1. on split.io dashboard, create a split named `test_global_feature_flag`, traffic type can be `global` or `account`

2. define treatment `on` and `off`, configure the `Set the default rule` to serve `off`

3. run `http 'localhost:3030/test_global_feature_flag'` in command line, response should be `{"ok": true, "status": "off"}`

4. In Rails console, run `SPLIT_CLIENT.get_treatment('global', 'test_global_feature_flag')`, result should be `off`

5. on split.io dashboard, change default rule of split `test_global_feature_flag` from `off` to `on`

6. run `http 'localhost:3030/test_global_feature_flag'` in command line, response should be `{"ok": true, "status": "on"}`

7. In Rails console, run `SPLIT_CLIENT.get_treatment('global', 'test_global_feature_flag')`, expected result is `on`, actual result is `off`. SDK data is not syned!

### Other information

1. In Rails console, after running `Rails.configuration.split_factory.resume!`, it seems the SDK in Rails console process starts to sync data with split.io web service.
