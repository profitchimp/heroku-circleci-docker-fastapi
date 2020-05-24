from fastapi import FastAPI

app = FastAPI()


@app.get("/ping")
def hello_world():
    return {"ping": "pong!"}
