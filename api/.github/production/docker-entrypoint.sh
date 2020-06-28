#!/bin/bash

# Collect static files
echo "Collect static files"
python manage.py collectstatic --noinput&

# Apply database migrations
echo "Apply database migrations"
python manage.py migrate --noinput

# Start server
echo "Starting gunicorn server"
gunicorn --bind :8000 --workers 3 recyclomedia.wsgi:application