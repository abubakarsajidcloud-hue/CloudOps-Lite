#!/bin/bash

echo "CloudOps Cost Report"

START_DATE=$(date +%Y-%m-01)
END_DATE=$(date +%Y-%m-%d)

aws ce get-cost-and-usage \
--time-period Start=$START_DATE,End=$END_DATE \
--granularity MONTHLY \
--metrics "UnblendedCost"