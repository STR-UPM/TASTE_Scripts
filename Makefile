# Based on DMT makefile:
# https://gitrepos.estec.esa.int/taste/dmt/-/blob/master/Makefile

PY_SRC:=scripts/taste-create-gitignore

FLAKE8_FLAGS:=--config=conf/.flake8 --benchmark
PYLINT_FLAGS:=--rcfile=conf/.pylintrc

all: tests

tests: flake8 pylint

flake8:
	@echo "-- [1] Performing syntax checks via flake8"
	@flake8 ${FLAKE8_FLAGS} ${PY_SRC} || exit 1

pylint:
	@echo "-- [2] Performing static analysis via pylint"
	@pylint ${PYLINT_FLAGS} ${PY_SRC} || exit 1

.PHONY: flake8 pylint
