import os

from fastapi import FastAPI

app = FastAPI()

ENVIRONMENT = os.environ["ENVIRONMENT"]


@app.get("/")
def read_root():
    return {"message": f"Hello {ENVIRONMENT} Kube"}
