# Based on DMT makefile:
# https://gitrepos.estec.esa.int/taste/dmt/-/blob/master/Makefile

PY_SRC:=taste-create-gitignore

all: tests

tests: flake8 pylint

flake8:
	@echo -- Performing syntax checks via flake8
	@flake8 --benchmark ${PY_SRC} || exit 1

pylint:
	@echo --ooO Performing static analysis via pylint
	@pylint ${PY_SRC} || exit 1

.PHONY: flake8 pylint
