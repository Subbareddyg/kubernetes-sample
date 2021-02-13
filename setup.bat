@ECHO OFF 
ECHO ============================
ECHO Please wait... While spinup Shopfront
kubectl delete deployment shopfront
@echo off
Echo "===================Shopfront Build ========================"
Echo "==============================================================================================="
Echo "==============================================================================================="
Echo "==============================================================================================="
call mvn -f C:\Subbu\Kubernetes\Java\shopfront\pom.xml clean install -U

docker build  -t shopfront  -f ./shopfront/Dockerfile .
ECHO docker login atbclkubernetes
docker login
:: Section 4: Tag the docker images
ECHO ==========================
ECHO docker tag shopfront atbclkubernetes/java-shopfront
docker tag shopfront atbclkubernetes/java-shopfront
ECHO ============================

:: Section 5: Push the docker images
ECHO ==========================
ECHO docker push atbclkubernetes/java-shopfront
docker push atbclkubernetes/java-shopfront
ECHO ============================
kubectl apply -f ./shopfront/shopfront.yml
ECHO ============================
ECHO ============================
ECHO ============================
Echo "===================Product catalog Build ========================"
Echo "==============================================================================================="
Echo "==============================================================================================="
Echo "==============================================================================================="
Echo "==============================================================================================="
call mvn -f C:\Subbu\Kubernetes\Java\productcatalog\pom.xml clean install -U
@ECHO OFF 
ECHO ============================
ECHO Please wait... While spinup Product catalog
kubectl delete deployment productcatalog
docker build  -t productcatalog  -f ./productcatalog/Dockerfile .
ECHO docker login 
::docker login
:: Section 4: Tag the docker images
ECHO ==========================
ECHO docker tag shopfront atbclkubernetes/java-shopfront
docker tag productcatalog atbclkubernetes/java-productcatalog
ECHO ============================

:: Section 5: Push the docker images
ECHO ==========================
ECHO docker push atbclkubernetes/java-productcatalog
docker push atbclkubernetes/java-productcatalog
ECHO ============================
kubectl apply -f ./productcatalog/productcatalog.yml
ECHO ============================
ECHO ============================
ECHO ============================

ECHO ================================================================================================"
ECHO ================================================================================================"
ECHO ================================================================================================"
Echo "===================Stock Manager Build ========================"
Echo "==============================================================================================="
Echo "==============================================================================================="
Echo "==============================================================================================="
Echo "==============================================================================================="
call mvn -f C:\Subbu\Kubernetes\Java\stockmanager\pom.xml clean install -U
@ECHO OFF 

ECHO ============================
ECHO Please wait... While spinup Stock manager
kubectl delete deployment stockmanager
docker build  -t stockmanager  -f ./stockmanager/Dockerfile .
ECHO docker login 
::docker login
:: Section 4: Tag the docker images
ECHO ==========================
ECHO docker tag stockmanaget atbclkubernetes/java-stock manager
docker tag stockmanager atbclkubernetes/java-stockmanager
ECHO ============================

:: Section 5: Push the docker images
ECHO ==========================
ECHO docker push atbclkubernetes/java-shopfront
docker push atbclkubernetes/java-stockmanager
ECHO ============================
kubectl apply -f ./stockmanager/stockmanager.yml
ECHO ============================
ECHO ============================
ECHO ============================

kubectl get pods
minikube service shopfront