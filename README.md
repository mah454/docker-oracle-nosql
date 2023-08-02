### Run container ### 
```
docker run -d --name=oracle-nosql -e NOSQL_STORE_NAME=sample -p 5000:5000 oracle-nosql-ce:latest 
```

### Change password policy and create user ###
```
change-policy -params passwordComplexityCheck=false
execute 'create user sample identified by "[sample-password]" admin' ; 
execute "GRANT readwrite TO USER sample"
```

Note: you can volume the file /opt/oracle-nosql/sample/security/user.passwd 

### connect to database ### 
```
docker exec -it oracle-nosql /admin-cli
```

### Connect to storage [AFTER CONNECT TO DATABASE] ###
```
connect store -host localhost -port 5000 -name sample -username sample -security sample/security/user.security
```
