#!/bin/bash

echo "Starting Fogsight AI Animation System..."

if [ ! -d "../fogsight" ]; then
    echo "Error: fogsight directory not found. Please ensure fogsight is cloned in the parent directory."
    exit 1
fi

echo "Starting Fogsight backend service on port 8000..."
cd ../fogsight
python start_fogsight.py &
FOGSIGHT_PID=$!

sleep 3

echo "Starting Jekyll development server..."
cd ../missing-semester
bundle exec jekyll serve --host 0.0.0.0 --port 4000 &
JEKYLL_PID=$!

echo ""
echo "=== Fogsight AI Animation System Started ==="
echo "Fogsight Backend: http://localhost:8000"
echo "Jekyll Frontend: http://localhost:4000"
echo "Fogsight Interface: http://localhost:4000/fogsight/"
echo ""
echo "Press Ctrl+C to stop both services"

cleanup() {
    echo ""
    echo "Stopping services..."
    kill $FOGSIGHT_PID 2>/dev/null
    kill $JEKYLL_PID 2>/dev/null
    exit 0
}

trap cleanup SIGINT SIGTERM

wait
