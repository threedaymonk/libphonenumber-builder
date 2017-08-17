SHELL = /bin/sh
JS_DIR = vendor/libphonenumber/javascript/i18n/phonenumbers
COMPILER_JAR = vendor/closure-compiler/closure-compiler.jar
COMPILER_URL = "http://dl.google.com/closure-compiler/compiler-latest.tar.gz"
LIB_ROOT = vendor/closure-library

.PHONY : all clean

all : build/libphonenumber.js

build/libphonenumber.js : src/exports.js $(COMPILER_JAR)
	$(LIB_ROOT)/closure/bin/build/closurebuilder.py \
		--output_mode=script \
		--root="$(LIB_ROOT)" \
		--input="$(JS_DIR)/metadata.js" \
		--input="$(JS_DIR)/phonemetadata.pb.js" \
		--input="$(JS_DIR)/phonenumber.pb.js" \
		--input="$(JS_DIR)/phonenumberutil.js" \
		--input=src/exports.js \
		--namespace="i18n.phonenumbers.Error" \
		--namespace="i18n.phonenumbers.NumberFormat" \
		--namespace="i18n.phonenumbers.PhoneMetadata" \
		--namespace="i18n.phonenumbers.PhoneMetadataCollection" \
		--namespace="i18n.phonenumbers.PhoneNumber" \
		--namespace="i18n.phonenumbers.PhoneNumber.CountryCodeSource" \
		--namespace="i18n.phonenumbers.PhoneNumberDesc" \
		--namespace="i18n.phonenumbers.PhoneNumberFormat" \
		--namespace="i18n.phonenumbers.PhoneNumberType" \
		--namespace="i18n.phonenumbers.PhoneNumberUtil" \
		--namespace="i18n.phonenumbers.metadata" \
		"$(JS_DIR)/metadata.js" \
		"$(JS_DIR)/phonemetadata.pb.js" \
		"$(JS_DIR)/phonenumber.pb.js" \
		"$(JS_DIR)/phonenumberutil.js" \
		src/exports.js \
		| java -jar $(COMPILER_JAR) \
		> $@.tmp && mv $@.tmp $@

$(COMPILER_JAR) :
	curl -L "$(COMPILER_URL)" \
		| tar -C $(@D) --gunzip --extract --verbose \
		&& mv $(@D)/$$(ls $(@D) | grep jar) $@

clean :
	rm -f build/*
