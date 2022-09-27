# Put example

This is an example usage of the [Put](https://github.com/testdouble/put) gem,
which was written for a screencast demoing how to sort Ruby objects with
`sort_by`, with and without the Put's help

[sorts_break_room_duty_roster_without_put.rb](/sorts_break_room_duty_roster_without_put.rb)
is the original example sorting the items without Put and can be run with:

```
$ bundle exec ruby sorts_break_room_duty_roster_without_put.rb
```

[sorts_break_room_duty_roster.rb](/sorts_break_room_duty_roster.rb) uses the
Put gem to clean up the method a bit by providing a more intent-revealing API
and nil safety:

```
$ bundle exec ruby sorts_break_room_duty_roster.rb
```