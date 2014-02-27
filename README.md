# Chell

![Temporary Chell's logo](https://raw.github.com/toooooooby/chell/master/resources/logo.png)

Ruby + csv + [pry] + [lambda_driver] => csv-shell => **Chell!!** 

`Chell` is a servant who helps us with our cooking of CSV(Comma-separated values)

## Installation

    $ gem install chell

## Usage

```
$ cat foobar.csv
    :
$ chell foobar.csv
> size
10
> headers
:  # Show first column of CSV
> col 3
  :
> row 2
  :
> col(3).map.sort.uniq
  :
> col(3){|x| x.upcase }
  :
> col!(3){|x| x.upcase }
  :
> write 'test.csv'
```

with [Lambda Driver][lambda_driver]

```
> col(3).map(&:to_s >> :upcase)
```

## Todos

* todo: Add some badges below title after finishing configurations their services.
* todo: Make a proper graphical logo( like a servant with a machine toolkit )
* todo: Add encoding options like `ruby -Ks chell.rb`
* todo: Write spec(It's a shame that this project is not test first!!)
* todo: Write usage.

----

[pry]: http://pryrepl.org/ "Pry - an IRB alternative and runtime developer console"
[lambda_driver]: http://yuroyoro.github.io/lambda_driver/ "LambdaDriver by yuroyoro"
