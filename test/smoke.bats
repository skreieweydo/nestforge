#!/usr/bin/env bats

@test "NestForge exists and is executable" {
	[ -x "$BATS_TEST_DIRNAME/../bin/nestforge" ]
}
