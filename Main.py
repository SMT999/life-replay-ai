from fastapi import FastAPI

app = FastAPI(
    title="Life Replay AI",
    version="1.0.0"
)

@app.get("/")
def health():
    return {
        "status": "online",
        "app": "Life Replay AI"
    }
