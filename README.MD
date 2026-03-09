

open Docker desktop

open project folder in terminal



docker login

Enter USERNAME

Enter Password



docker build -t image-name .

docker build -t theflaskapp .    



docker images



docker run -p 8080:8080 image-name

docker run -p 8080:8080 theflaskapp                 #run the local image as container



docker tag local-image-name dockerhub-username/repository-name:tag

docker tag theflaskapp shalini253/theflaskapp:v1



docker push dockerhub-username/repository-name:tag

docker push shalini253/theflaskapp:v1                #app containerized and live on dockerhub



docker run -p 8080:8080 shalini253/theflaskapp:v1   #run the remote image as container 





