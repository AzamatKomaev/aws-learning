import os

from fastapi import FastAPI


APP_NAME = os.getenv("APP_NAME")

app = FastAPI()

@app.get("/hello")
def say_hello():
    return {"text": f"Hello from {APP_NAME}"}


@app.get("/ok")
def is_ok():
    return {"status": "Ok"}


if __name__ == "__main__":
    app.st
