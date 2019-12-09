#!/bin/bash

ARGS=()
ARGS+=(--token $INPUT_TOKEN)
[ -n "$INPUT_RATE"           ] && ARGS+=(--rate "$INPUT_RATE")
[ "$INPUT_MESSAGE" == 'true' ] && ARGS+=(--message)
[ "$INPUT_FILE"    == 'true' ] && ARGS+=(--file)
[ -n "$INPUT_CHANNEL"        ] && ARGS+=(--channel "$INPUT_CHANNEL")
[ -n "$INPUT_DIRECT"         ] && ARGS+=(--direct "$INPUT_DIRECT")
[ -n "$INPUT_GROUP"          ] && ARGS+=(--group "$INPUT_GROUP")
[ -n "$INPUT_MPDIRECT"       ] && ARGS+=(--mpdirect "$INPUT_MPDIRECT")
[ -n "$INPUT_USER"           ] && ARGS+=(--user "$INPUT_USER")
[ "$INPUT_BOT" == 'true'     ] && ARGS+=(--bot)
[ -n "$INPUT_AFTER"          ] && ARGS+=(--after "$INPUT_AFTER")
[ -n "$INPUT_BEFORE"         ] && ARGS+=(--before "$INPUT_BEFORE")
[ -n "$INPUT_TYPES"          ] && ARGS+=(--types "$INPUT_TYPES")
[ "$INPUT_PERFORM" == 'true' ] && ARGS+=(--perform)
echo "slack-cleaner ${ARGS[@]}"
slack-cleaner "${ARGS[@]}"
