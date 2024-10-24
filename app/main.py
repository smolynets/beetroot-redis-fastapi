from fastapi import FastAPI, HTTPException

from app.routers import redis_routers


app = FastAPI()

app.include_router(redis_routers.router)


@app.get("/ping")
async def ping():
    return {"message": "Applications is running!"}
