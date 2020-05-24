# [Python]
import pytest
from fastapi import FastAPI
from starlette.testclient import TestClient
from httpx import AsyncClient

# [App]
from main import app


@pytest.fixture(scope="module")
def test_client() -> TestClient:
    client = TestClient(app)
    yield client  # Testing happens here.


@pytest.fixture(scope="session")
def test_async_client() -> AsyncClient:
    client = AsyncClient(base_url="http://testserver", app=test_app)
    return client


@pytest.fixture
def test_app() -> FastAPI:
    from main import app  # local import for testing purpose
    return app
