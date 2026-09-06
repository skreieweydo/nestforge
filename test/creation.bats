#!/usr/bin/env bats

setup() {
    TEST_ROOT=$(mktemp -d "${TMPDIR:-/tmp}/nestforge-test.XXXXXX")
    cd "$TEST_ROOT"
}

teardown() {
    rm -rf -- "$TEST_ROOT"
}

@test "creates the fixed nest directory" {
    run "$BATS_TEST_DIRNAME/../bin/nestforge"

    [ "$status" -eq 0 ]
    [ -d "$TEST_ROOT/nest" ]

    first_entry=$(
        find "$TEST_ROOT/nest" \
            -mindepth 1 \
            -maxdepth 1 \
            -print \
            -quit
    )

    [ -z "$first_entry" ]
}

@test "fails when nest already exists" {
    mkdir "$TEST_ROOT/nest"

    run "$BATS_TEST_DIRNAME/../bin/nestforge"

    [ "$status" -ne 0 ]
}
