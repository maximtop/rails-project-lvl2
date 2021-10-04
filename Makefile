.PHONY: test

install:
	bundle install
	yarn install

start:
	bin/rails server -e development

test:
	bin/rails test

lint:
	bundle exec rubocop