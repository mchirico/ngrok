PROJECT = cwxstat-23
NAME = ngrok
TAG = dev
TEST = test
QT = qt

.PHONY: kind
kind:
	kind load docker-image gcr.io/$(PROJECT)/$(NAME):$(TAG)



.PHONY: docker-build
docker-build:
	docker build -t gcr.io/$(PROJECT)/$(NAME):$(TAG) -f Dockerfile .

.PHONY: start
start:
	rm -rf static
	(cd angular && ./updateStatic.sh) && npm run build && npm start



dev:
	rm -rf static
	(cd angular && ./updateStatic.sh)
	docker build -t gcr.io/$(PROJECT)/$(NAME):$(TAG) -f Dockerfile_dev .


devnc:
	rm -rf static
	(cd angular && ./updateStatic.sh)
	docker build --no-cache -t gcr.io/$(PROJECT)/$(NAME):$(TAG) -f Dockerfile_dev .



deploy:
	rm -rf static
	(cd angular && ./updateStatic.sh)
	gcloud config set gcloudignore/enabled false --project $(PROJECT)
	gcloud builds submit --tag gcr.io/$(PROJECT)/$(NAME)cloud --project $(PROJECT) --timeout 35m23s
	gcloud run deploy $(NAME)cloud --image gcr.io/$(PROJECT)/$(NAME)cloud \
              --platform managed --allow-unauthenticated --project $(PROJECT) \
              --region us-east1 --port 3000 --max-instances 3  --memory 256Mi


sh:
	docker run --rm -it --entrypoint /bin/sh gcr.io/cwxstat-23/ts:dev


daemon:
	docker run -p 3000:3000 --rm -it -d --name $(NAME) gcr.io/$(PROJECT)/$(NAME):$(TAG)

run:
	docker run -p 3000:3000 --rm -it --name $(NAME)  gcr.io/$(PROJECT)/$(NAME):$(TAG) 

stop:
	docker stop $(NAME)

logs:
	docker logs $(NAME)
