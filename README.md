# Test Task: FastAPI and Redis storage

## Task Description:
Providing example of fastapi and redis interaction


#### Setup:

##### Run in project root directory:
	docker-compose up

#### REST API:
##### Implement a REST API with the following capabilities:
1. GET /redis/keys/ - get all content in redis
2. POST /redis/set/ - add new key/value pair
3. GET /redis/exist/{key} - check key existance
4. DELETE /redis/delete/ - delete key/value pair
5. POST /redis/incr/ - increment value on 1
6. POST /redis/incrby/ - increment value on particular value
#### OpenAPI/Swagger Specification:
Provide a detailed specification of the API in OpenAPI/Swagger format - http://0.0.0.0:8000/docs

#### Test Data:
Created .sh script with curl calls - test_api.sh.
##### For check script run result:
    docker logs curl-runner
