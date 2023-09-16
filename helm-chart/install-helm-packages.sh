#!/usr/bin/env bash
source ../vars.txt
helm dependency build
helm install test .
