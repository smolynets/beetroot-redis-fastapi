from fastapi import APIRouter, HTTPException
import redis

from app.schemas.redis import KeyValue

router = APIRouter(
    prefix="/redis", tags=["redis"], responses={404: {"description": "Not found"}}
)

r = redis.Redis(host="redis", port=6379, decode_responses=True)


@router.get("/keys/")
async def get_all_keys():
    """
    Get all existant pairs in redis
    """
    keys = r.keys()
    key_value_list = {key: r.get(key) for key in keys}
    return key_value_list


@router.post("/set/")
async def set_key_value(item: KeyValue):
    """
    Set a key-value pair in Redis
    """
    if not item.key or not item.value:
        raise HTTPException(status_code=400, detail="Key and value must not be empty.")

    existing_value = r.get(item.key)
    if existing_value is not None:
        return {
            "message": f"Key {item.key} already exists with value '{existing_value}'."
        }

    r.set(item.key, item.value)
    return {"message": f"Key {item.key} set.", "value": item.value}


@router.get("/exist/{key}")
async def check_key_existance(key):
    """
    Check if key exists in redis
    """
    is_key = r.exists(key)
    res = f"Record with key {key} exists" if is_key else f"Record doesn't exist"
    return res


@router.delete("/delete/")
async def delete_key(key: str):
    """
    Delete a key from Redis
    """
    if not r.exists(key):
        raise HTTPException(status_code=400, detail="Key doesn't exist")
    r.delete(key)
    return {"message": f"Key {key} has been deleted successfully"}


@router.post("/incr/")
async def redis_incr(key: str):
    """
    Increment a counter var value in Redis by 1
    """
    count = r.incr(key)
    return {key: count}


@router.post("/incrby/")
async def redis_incrby(item: KeyValue):
    """
    Increment a int value in Redis by key
    """
    if not isinstance(item.value, int):
        raise HTTPException(status_code=400, detail="Value is not integer")
    count = r.incrby(item.key, item.value)
    return {"counter": count}


@router.post("/mset/")
async def mset_keys(items: dict):
    """
    Set a multiple pairs in Redis (bulk operation)
    """
    r.mset(items)
    return {"message": "Multiple keys set successfully"}
