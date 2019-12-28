#!/bin/bash

PROG="$1"
TESTINTERNAL=$(dirname $PROG)/testinternals

$TESTINTERNAL
if [ "$?" = "0" ]; then
    echo OK: test internals
fi
RC="0"

tests/test_c1_meters.sh $PROG
if [ "$?" != "0" ]; then RC="1"; fi

tests/test_t1_meters.sh $PROG
if [ "$?" != "0" ]; then RC="1"; fi

tests/test_shell.sh $PROG
if [ "$?" != "0" ]; then RC="1"; fi

tests/test_shell2.sh $PROG
if [ "$?" != "0" ]; then RC="1"; fi

tests/test_meterfiles.sh $PROG
if [ "$?" != "0" ]; then RC="1"; fi

tests/test_config1.sh $PROG
if [ "$?" != "0" ]; then RC="1"; fi

tests/test_logfile.sh $PROG
if [ "$?" != "0" ]; then RC="1"; fi

tests/test_elements.sh $PROG
if [ "$?" != "0" ]; then RC="1"; fi

tests/test_listen_to_all.sh $PROG
if [ "$?" != "0" ]; then RC="1"; fi

tests/test_multiple_ids.sh $PROG
if [ "$?" != "0" ]; then RC="1"; fi

tests/test_conversions.sh $PROG
if [ "$?" != "0" ]; then RC="1"; fi

#tests/test_oneshot.sh $PROG broken test
#if [ "$?" != "0" ]; then RC="1"; fi

tests/test_wrongkeys.sh $PROG
if [ "$?" != "0" ]; then RC="1"; fi

tests/test_config4.sh $PROG
if [ "$?" != "0" ]; then RC="1"; fi

tests/test_linkmodes.sh $PROG
if [ "$?" != "0" ]; then RC="1"; fi

tests/test_additional_json.sh $PROG
if [ "$?" != "0" ]; then RC="1"; fi

tests/test_rtlwmbus.sh $PROG
if [ "$?" != "0" ]; then RC="1"; fi

tests/test_stdin_and_file.sh $PROG
if [ "$?" != "0" ]; then RC="1"; fi

tests/test_serial_bads.sh $PROG
if [ "$?" != "0" ]; then RC="1"; fi

exit $RC
