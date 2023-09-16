#!/usr/bin/env bash
helm dependency build
helm install test .