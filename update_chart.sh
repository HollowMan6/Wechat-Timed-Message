#!/usr/bin/env bash

cd helmChart
helm package ./wechat-timed-message
cd ..
helm repo index . --url http://hollowman.ml/Wechat-Timed-Message