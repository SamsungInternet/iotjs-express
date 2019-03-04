#!/bin/make -f
# -*- makefile -*-
# SPDX-License-Identifier: MIT
# Copyright: 2018-present Samsung Electronics France SAS, and contributors

default: help iotjs/start
	@echo "# $@: $^"

project?=iotjs-express
example?=example/index.js
eslint_file?=node_modules/eslint/bin/eslint.js
runtime?=iotjs

deploy_dir ?= ${CURDIR}/tmp/deploy
deploy_modules_dir ?= ${deploy_dir}/iotjs_modules
deploy_module_dir ?= ${deploy_modules_dir}/${project}
deploy_srcs += ${deploy_module_dir}/lib/express.js
deploy_srcs += ${deploy_module_dir}/index.js

help:
	@echo "Usage:"
	@echo "# make start"

node/start: ${example}
	node $<

package.json:
	npm init

node_modules: package.json
	npm install

node/npm/start: node_modules
	npm start

start: ${runtime}/start
	@echo "# $@: $^"

cleanall:
	rm -rf iotjs_modules node_modules

${eslint_file}:
	npm install eslint --save-dev

eslint: ${eslint_file} .eslintrc.js
	${eslint_file} --no-color --fix .
	${eslint_file} --no-color .

lint: eslint
	@echo "# $@: $^"

iotjs/start: ${example}
	iotjs $<

iotjs/debug: ${example}
	node $<

${deploy_module_dir}/%: %
	@echo "# TODO: minify: $<"
	install -d ${@D}
	install $< $@

deploy: ${deploy_srcs}
	ls $<
