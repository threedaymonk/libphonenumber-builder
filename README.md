# libphonenumber builder

## What it is

This is a simple repository and Makefile to compile Google's
[libphonenumber](https://github.com/googlei18n/libphonenumber/tree/master/javascript)
JavaScript library.

Their [demo](http://rawgit.com/googlei18n/libphonenumber/master/javascript/i18n/phonenumbers/demo-compiled.html)
gives an idea of what libphonenumber can do, but they don't make it available
in an immediately usable form.

## How to use it

```sh
$ git clone https://github.com/threedaymonk/libphonenumber-builder.git
$ make
```

and copy `build/libphonenumber.js` to wherever you need it.

With older versions of git, you might need to initialise and fetch the
submodules between steps one and two.

## What's available

The following symbols are exported:

* i18n.phonenumbers.PhoneNumberFormat
* i18n.phonenumbers.PhoneNumberType
* i18n.phonenumbers.PhoneNumberUtil
* i18n.phonenumbers.PhoneNumberUtil.ValidationResult
