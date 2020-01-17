# golang_mongodb

To deploy services using modular variant:
```
./deploy_golang.sh
```

To deploy service using multi-staged variant
```
docker build -t golang:app multi_staged_variant
docker run -d --name app --hostname app --restart=always -p 8080:8080 golang:app
```

To verify if service is up and running:
for mongo DB : 
```
#mongo localhost/<dbname>
```

for golang: (Assuming API is deployed on port 8080 in this case)
```
#curl http://localhost:8080/hellops 
```
