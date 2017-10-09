# README

* `bindle install`
* `rake db:create`
* `rake db:migrate`

###Create model
```
curl -X GET \
  http://localhost:3000/models.json \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -d '{
  "model": {
    "schema":{
      "title" :"string",
      "content":"string",
      "tags":"array"
    },
    "title":"blogpost"
  }
}'
```

**response**

```json
{
    "id": 9,
    "schema": {
        "title": "string",
        "content": "string",
        "tags": "array"
    },
    "title": "blogpost",
    "created_at": "2017-10-09T07:48:46.582Z",
    "updated_at": "2017-10-09T07:48:46.582Z",
    "url": "http://localhost:3000/models/9.json"
}
```

###Create valid entity

```
curl -X POST \
  http://localhost:3000/entities.json \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -d '{
  "entity": {
    "content":{
      "title" :"Foo",
      "content":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ut libero urna. Donec sed ultricies ipsum. Proin eget lacus vel purus finibus sodales et eu ipsum. Cras id neque finibus, hendrerit lacus a, accumsan nibh. Vivamus finibus dictum dui. Proin sit amet velit nisl. Duis blandit augue a felis dapibus ultricies. Aliquam id dignissim justo, a fringilla lorem. Sed imperdiet eros augue, ut hendrerit neque fringilla bibendum. In sagittis dui at ligula varius, ut gravida arcu ultrices. Nunc faucibus rhoncus diam, ac imperdiet metus lacinia nec. Sed fermentum lectus metus, vel molestie lectus tempus in. In sed tempor urna, et maximus magna. Etiam cursus mi quis erat laoreet aliquet. Duis non tincidunt lacus, a bibendum quam. Maecenas at diam semper massa commodo sagittis at sit amet lectus.",
      "tags":["a", "b", "c"]
    },
    "title":"blogpost",
    "model_id":8
  }
}'
```

**response**

```json
{
    "id": 2,
    "content": {
        "title": "Foo",
        "content": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ut libero urna. Donec sed ultricies ipsum. Proin eget lacus vel purus finibus sodales et eu ipsum. Cras id neque finibus, hendrerit lacus a, accumsan nibh. Vivamus finibus dictum dui. Proin sit amet velit nisl. Duis blandit augue a felis dapibus ultricies. Aliquam id dignissim justo, a fringilla lorem. Sed imperdiet eros augue, ut hendrerit neque fringilla bibendum. In sagittis dui at ligula varius, ut gravida arcu ultrices. Nunc faucibus rhoncus diam, ac imperdiet metus lacinia nec. Sed fermentum lectus metus, vel molestie lectus tempus in. In sed tempor urna, et maximus magna. Etiam cursus mi quis erat laoreet aliquet. Duis non tincidunt lacus, a bibendum quam. Maecenas at diam semper massa commodo sagittis at sit amet lectus.",
        "tags": [
            "a",
            "b",
            "c"
        ]
    },
    "title": "blogpost",
    "model_id": 8,
    "created_at": "2017-10-09T07:49:26.623Z",
    "updated_at": "2017-10-09T07:49:26.623Z",
    "url": "http://localhost:3000/entities/2.json"
}
```

###Create invalid entity

```
curl -X POST \
  http://localhost:3000/entities.json \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -d '{
  "entity": {
    "content":{
      "tags":["a", "b", "c"]
    },
    "title":"blogpost",
    "model_id":8
  }
}'
```

**response**

```json
{
    "content": [
        {
            "title": "string required"
        },
        {
            "content": "string required"
        }
    ]
}
```