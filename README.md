Ruby bencode binding
====================

This is a simple library for reading and writing bencoded data.


What is bencode?
----------------

Bencode is a simple data serialization format used by the popular 
[BitTorrent](http://bittorrent.org/) P2P file sharing system.

It contains only four data types, namely:

- byte strings
- integers
- lists
- dictionaries


Examples
--------

Encoding objects is as simple as calling `#bencode` on them:

```ruby
"foo bar".bencode                   # => "7:foo bar"
42.bencode                          # => "i42e"
[1, 2, 3].bencode                   # => "li1ei2ei3ee"
{"foo" => 1, "bar" => -10}.bencode  # => "d3:bari-10e3:fooi1ee"
```

Decoding a complete data stream is as easy as calling `BEncode.load(data)`.

Decoding a data stream in chunks works as follows:

```ruby
irb(main):007:0> stream = BEncode::Parser.new(StringIO.new "d3:foo3:bared3:baz3:quxe")
=> #<BEncode::Parser:0x007fbe6b008c88 @stream=#<StringIO:0x007fbe6b008cd8>>
irb(main):008:0> stream.parse!
=> {"foo"=>"bar"}
irb(main):009:0> stream.parse!
=> {"baz"=>"qux"}
```

License
-------

Released under the MIT license.


Contributors
------------

- Daniel Schierbeck ([dasch](https://github.com/dasch))
- Mike Hodgson ([mikehodgson](https://github.com/mikehodgson))
- Andrew Danforth
- Eric Himmelreich
- Allen Madsen ([blatyo](https://github.com/blatyo))
- Ian Levesque ([ianlevesque](https://github.com/ianlevesque))
- Dirk Geurs ([Dirklectisch](https://github.com/Dirklectisch))
