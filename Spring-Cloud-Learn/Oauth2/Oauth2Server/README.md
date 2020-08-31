#schema.sql路径：			https://github.com/spring-projects/spring-security-oauth/blob/master/spring-security-oauth2/src/test/resources/schema.sql

#用户名/密码：				user/user

#授权码模式
#获取授权码：				http://localhost:8081/oauth2/oauth/authorize?client_id=Api_Client&response_type=code&scope=ALL&redirect_uri=https://www.baidu.com/
#POST获取access_token：	http://localhost:8081/oauth2/oauth/token?client_id=curl_client&client_secret=secret&grant_type=authorization_code&code=5PgfcD&redirect_uri=https://www.baidu.com/

#简化模式
#获取授权码：				http://localhost:8081/oauth2/oauth/authorize?client_id=curl_client&response_type=token&scope=write&redirect_uri=https://www.baidu.com/ 

#密码模式
#POST请求				http://localhost:8081/oauth2/oauth/token？client_id=c1&client_secret=secret&grant_type=password&username=shangsan&password=123 


#网关获取授权码：			http://localhost:8083/Oauth2Server/oauth2/oauth/authorize?client_id=Api_Client&response_type=code&scope=ALL&redirect_uri=https://www.baidu.com/
#网关请求资源：				http://localhost:8083/ResourceServer/resource/res1


网关测试					http://localhost:8083/RESOURCE-A/resourcea/resa
						http://localhost:8083/RESOURCE-B/resourceb/resb