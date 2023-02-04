#!/bin/bash
bash -e

mv ./static/* /public/
exec "$@"
