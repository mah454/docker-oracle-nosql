### Change password policy and create user ###
change-policy -params passwordComplexityCheck=false
execute 'create user dandelion identified by "dandelionpass" admin' ; 
execute "GRANT readwrite TO USER dandelion"

### after alter table update file dandelion/security/user.passwd ###

### Run container ### 
docker run -d --name=oracle-nosql -e NOSQL_STORE_NAME=sample -p 5000:5000 oracle-nosql-ce:latest 

### connect to database ### 
java -Xmx256m -Xms256m -jar ./lib/kvstore.jar runadmin -store dandelion -host localhost -port 5000 -username admin -security dandelion/security/user.security


### Connect to storage [AFTER CONNECT TO DATABASE] ###
connect store -host localhost -port 5000 -name dandelion -username dandelion -security dandelion/security/user.security
