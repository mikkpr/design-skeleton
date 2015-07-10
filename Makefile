PATH  := node_modules/.bin:$(PATH)

APPNAME := demo

JS_SRC := src/javascripts
JS_DIST := $(APPNAME)/javascripts

JS_LIB_FILE := $(JS_SRC)/libs.js
JS_LIBS := node_modules/jquery/dist/jquery.js

CSS_SRC := src/stylesheets
CSS_DIST := $(APPNAME)/stylesheets

.PHONY: all

watch:
	(while true; do make all --silent; sleep 1; done)

all: $(JS_LIB_FILE) $(JS_DIST)/modernizr.min.js $(JS_DIST)/$(APPNAME).min.js $(CSS_DIST)/$(APPNAME).min.css

$(JS_DIST)/$(APPNAME).min.js: $(JS_SRC)/$(APPNAME).js $(JS_LIB_FILE)
	echo "Rebuilding $@"
	mkdir -p $(dir $@)
	cat $(JS_LIB_FILE) > $(JS_DIST)/$(APPNAME).min.js
	cat $(JS_SRC)/$(APPNAME).js | uglifyjs - -c -m >> $(JS_DIST)/$(APPNAME).min.js
	cd $(APPNAME) && kit push javascripts/$(@F) && cd ..
	echo "Done!"

$(CSS_DIST)/$(APPNAME).min.css: $(CSS_SRC)/*.css
	echo "Rebuilding $@"
	mkdir -p $(dir $@)
	cssmin $(CSS_SRC)/normalize.css > $(CSS_DIST)/$(APPNAME).min.css
	cssmin $(CSS_SRC)/skeleton.css >> $(CSS_DIST)/$(APPNAME).min.css
	cssmin $(CSS_SRC)/$(APPNAME).css >> $(CSS_DIST)/$(APPNAME).min.css
	cd $(APPNAME) && kit push stylesheets/$(@F) && cd ..
	echo "Done!"

$(JS_LIB_FILE):
	cat $(JS_LIBS) | uglifyjs - -c -m > $(JS_SRC)/libs.js

$(JS_DIST)/modernizr.min.js: $(JS_SRC)/modernizr.min.js
	cp $< $@
	cd $(APPNAME) && kit push javascripts/$(@F) && cd ..

