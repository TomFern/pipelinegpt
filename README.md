# PipelineGPT

Generates Semaphore pipelines using OpenAI GPT-3

**Experimental**

## Run locally

Setup

```bash
$ virtualenv venv
$ source venv/bin/activate
$ pip install -r src/requirements.txt
```

Add API keys to shell env file

```bash
$ cp env-shell-example .env-shell
$ nano .env-shell
$ source .env-shell
```

Run locally

```bash
$ FLASK_RUN=src/app.py flask run -p 3000 -h localhost
```

Test completion

```bash
$ curl -X POST -d '{ "prompt": "Create a CI pipeline that builds and pushed Docker image to Docker Hub"}' -H 'Content-Type: application/json' "localhost:3000/complete"
```

## Run in Docker

Build image

```bash
$ docker build -t pipelinegpt .
```

Add API keys to env file

```bash
$ cp env-example .env
$ nano .env
```

Run in container

```bash
$ docker run --env-file .env --rm -d -p 8000:8000 pipelinegpt
```

Test a completion:

```bash
$ curl -X POST -d '{ "prompt": "Create a CI pipeline that builds and pushed Docker image to Docker Hub"}' -H 'Content-Type: application/json' "localhost:8000/complete"
```

## Deploy to Fly.io

After installing `flyctl` and authenticating, create/update launch config:

```bash
$ flyctl launch
```

Upload your API tokens as secrets with:

```bash
$  cat .env | flyctl secrets import
```


To (re)deploy:

```bash
$ flyctl deploy
```

View running apps:

```bash
$ flyctl apps list
```

Test API (change URL as needed):

```bash
$ curl -X POST -d '{ "prompt": "Create a CI pipeline that builds and pushed Docker image to Docker Hub"}' -H 'Content-Type: application/json' https://bright-rose-2170.fly.dev/complete
```

Stop app:

```bash
$ flyctl app destroy bright-rose-2170
```


