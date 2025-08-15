# Python Web Service Template

A production-ready Python web service template built with FastAPI. This template provides a solid foundation for building REST APIs with essential features like health checks, CRUD operations, proper error handling, and comprehensive testing.

## Features

- **FastAPI Framework**: Modern, fast web framework for building APIs
- **Health Check Endpoints**: Built-in health monitoring for load balancers
- **Structured Logging**: Configurable logging with JSON output for production
- **Error Handling**: Comprehensive error handling with structured responses
- **Configuration Management**: Environment-based configuration with validation
- **API Documentation**: Automatic OpenAPI/Swagger documentation
- **Testing Suite**: Comprehensive test coverage with pytest
- **Development Tools**: Hot reload, debugging support, and development utilities

## Quick Start

### Prerequisites

- Python 3.9+
- pip or poetry for dependency management

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd python-web-service-template
```

2. Create and activate a virtual environment:
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. Install dependencies:
```bash
pip install -r requirements.txt
```

4. Create environment configuration:
```bash
cp .env.example .env
# Edit .env with your configuration
```

### Running the Service

#### Development Mode
```bash
python -m uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

#### Production Mode
```bash
python -m uvicorn app.main:app --host 0.0.0.0 --port 8000
```

#### Using the convenience script
```bash
./activate.sh
```

### API Documentation

Once the service is running, you can access:

- **Interactive API docs**: http://localhost:8000/docs
- **ReDoc documentation**: http://localhost:8000/redoc
- **OpenAPI JSON**: http://localhost:8000/openapi.json

## API Endpoints

### Health Checks
- `GET /health` - Service health status
- `GET /health/ready` - Readiness check for load balancers

### Root
- `GET /` - Basic service information

## Project Structure

```
├── app/
│   ├── __init__.py
│   ├── main.py              # Application entry point
│   ├── config.py            # Configuration management
│   ├── models/
│   │   ├── __init__.py
│   │   └── health.py        # Pydantic models
│   ├── routers/
│   │   ├── __init__.py
│   │   └── health.py        # Health check endpoints
│   └── utils/
│       ├── __init__.py
│       ├── logging.py       # Logging configuration
│       └── exceptions.py    # Custom exceptions
├── tests/
│   ├── __init__.py
│   ├── conftest.py          # Pytest fixtures
│   └── test_health.py       # Health endpoint tests
├── .env.example             # Environment variables template
├── requirements.txt         # Dependencies
└── README.md               # This file
```

## Configuration

The service uses environment variables for configuration. Copy `.env.example` to `.env` and modify as needed:

```env
# Server Configuration
HOST=0.0.0.0
PORT=8000

# Application Configuration
APP_NAME=Python Web Service Template
VERSION=1.0.0
ENVIRONMENT=development
DEBUG=false

# Logging Configuration
LOG_LEVEL=INFO

# CORS Configuration (comma-separated)
CORS_ORIGINS=http://localhost:3000,http://localhost:8080
```

## Testing

Run the test suite:

```bash
# Run all tests
python -m pytest

# Run with coverage
python -m pytest --cov=app

# Run specific test file
python -m pytest tests/test_health.py

# Run with verbose output
python -m pytest -v
```

## Development

### Adding New Endpoints

1. Create a new router in `app/routers/`
2. Define Pydantic models in `app/models/`
3. Add business logic in `app/services/` (if needed)
4. Register the router in `app/main.py`
5. Add tests in `tests/`

### Code Style

The project follows Python best practices:
- PEP 8 style guide
- Type hints for better code documentation
- Docstrings for functions and classes
- Structured error handling

## Deployment

### Docker (Recommended)

Create a `Dockerfile`:

```dockerfile
FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ ./app/

EXPOSE 8000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
```

### Environment Variables for Production

Set these environment variables in your production environment:

- `ENVIRONMENT=production`
- `DEBUG=false`
- `LOG_LEVEL=INFO`
- `HOST=0.0.0.0`
- `PORT=8000`

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Ensure all tests pass
6. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For questions and support, please open an issue in the repository.