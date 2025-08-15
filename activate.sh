#!/bin/bash
# Activation script for the Python Web Service Template

echo "🚀 Activating Python Web Service Template virtual environment..."
source venv/bin/activate

echo "✅ Virtual environment activated!"
echo "📦 Python version: $(python --version)"
echo "📍 Python location: $(which python)"
echo ""
echo "🔧 Available commands:"
echo "  python -m app.main                    # Run the FastAPI server"
echo "  python -m uvicorn app.main:app --reload  # Run with auto-reload"
echo "  pytest                               # Run tests"
echo "  deactivate                          # Exit virtual environment"
echo ""
echo "🌐 Server will be available at: http://localhost:8000"
echo "📚 API docs will be at: http://localhost:8000/docs"