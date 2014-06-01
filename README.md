DataDepo
=========

`DataDepo` is data depository utility for testing, etc.

Basic Usage
------------

When you write the following data file in YAML file
as `deops/users.yml`...

```
- name: John Doe
  email: john.doe@xxx.xx
  password: password
- name: Jane Doe
  email: jane.doe@xxx.xx
  password: drowssap
- name: John Smith
  email: john.smith@xxx.xx
  password: bassworq
```

you can access the contents the following manner:

```ruby
require 'data_depo'

DataDepo.definition_path = 'depos'
DataDepo.users.each do |u|
  puts u["name"]
end

=> John Doe
   Jane Doe
   John Smith
```

You can have multiple data files as one group.
In case you have the following two YAML files:

(depos/users/foo.yml)
```
- name: John Doe
  email: john.doe@xxx.xx
  password: password
- name: Jane Doe
  email: jane.doe@xxx.xx
  password: drowssap
```

(depos/users/baa.yml)
```
- name: John Roe
  email: john.roe@xxx.xx
  password: bassworq
- name: Jane Roe
  email: jane.roe@xxx.xx
  password: dassworp
```

You can access contents of the both files in the same manner.

```ruby
require 'data_depo'

DataDepo.definition_path = 'depos'
DataDepo.users.each do |u|
  puts u["name"]
end
```

When `DataDepo` receives a method, it searches a file or a directory
that has a name of the method in the path defined by `definition_path`
and tries to read data from there.

Other usage
------------

Custom action
~~~~~~~~~~~~~~

You can define some custom actions.
When you define the following module...

```ruby
module DataDepo
  module UsersAction
    def puts_all
      self.each do |u|
        puts u
      end
    end
  end
end
```

you can do this.

```ruby
DataDepo.users.puts_all
=> {"name"=>"John Doe", "email"=>"john.doe@xxx.xx", "password"=>"password"}
   ...
```
