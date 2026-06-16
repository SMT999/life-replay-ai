
from fastapi import FastAPI

app = FastAPI(
    title="Life Replay AI",
    version="1.0.0",
)


@app.get("/")
def home():
    return {
        "status": "online",
        "app": "Life Replay AI",
    }


@app.get("/health")
def health():
    return {"status": "healthy"}
