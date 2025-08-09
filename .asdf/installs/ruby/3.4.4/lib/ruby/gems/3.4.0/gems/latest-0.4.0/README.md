# Latest [![Build Status](https://secure.travis-ci.org/citrus/latest.png)](http://travis-ci.org/citrus/latest)

### Latest keeps us up to speed by querying rubygems.org for a gem's most recent version number. Yep, that's all it does.

Basically I was tired of visiting `https://rubygems.org/gems/whatever-gem` to find out a gem's most recent version.


------------------------------------------------------------------------------
Usage
------------------------------------------------------------------------------

After installing, use latest from your command line like so:


```bash
latest rails
# rails 3.2.2 (41013 downloads)

latest rails spree haml
# rails 3.2.2 (41014 downloads)
# spree 1.0.1 (279 downloads)
# haml 3.1.4 (289029 downloads)

latest rails spree --pre haml
# rails 3.2.2 (41015 downloads)
# spree --pre 1.0.0.rc4 (134 downloads)
# haml 3.1.4 (289029 downloads)
```

You can print latest's version like so:

```bash
latest -v
# Latest v0.4.0
```


------------------------------------------------------------------------------
Installation
------------------------------------------------------------------------------

As usual, just use the `gem install` command:

```bash
gem install latest
# or
sudo gem install latest
```


------------------------------------------------------------------------------
Testing
------------------------------------------------------------------------------

Testing is done with minitest/spec. Run the specs with:

```bash
bundle exec rake
```


------------------------------------------------------------------------------
Requirements
------------------------------------------------------------------------------

Other than rake and bundler for development, Latest has zero gem dependencies! All it requires is Ruby >= 1.9.2.


------------------------------------------------------------------------------
License
------------------------------------------------------------------------------

Copyright (c) 2011 - 2012 Spencer Steffen & Citrus, released under the New BSD License All rights reserved.
