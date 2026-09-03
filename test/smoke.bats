#!/usr/bin/env bats

@test "NestForge executable runs" {
    run "$BATS_TEST_DIRNAME/../bin/nestforge"

    [ "$status" -eq 0 ]
    [ "$output" = "NestForge is running." ]
}
