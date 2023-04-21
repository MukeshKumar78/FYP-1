#!/bin/bash
bash -e

cp -r /app/META-INF/public/* /public/
exec "$@"
