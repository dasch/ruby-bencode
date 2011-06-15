
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

    "foo bar".bencode                   # => "7:foo bar"
    42.bencode                          # => "i42e"
    [1, 2, 3].bencode                   # => "li1ei2ei3ee"
    {"foo" => 1, "bar" => -10}.bencode  # => "d3:bari-10e3:fooi1ee"


Decoding a data stream is as easy as calling `BEncode.load(data)`.


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
