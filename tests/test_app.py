import sys
import os
import pytest

# Add the src directory to the path
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'src')))

from app import app  # Importing app from the 'src' folder

@pytest.fixture
def client():
    with app.test_client() as client:
        yield client

def test_hello_world(client):
    """Test the root endpoint"""
    response = client.get('/')
    assert response.status_code == 200
    assert response.data == b'Hello, World!'

