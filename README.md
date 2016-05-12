# wepaas
#基于Rancher二次开发的容器管理平台
#非maven项目
#需要修改的是WEB-INF下面config目录service.xml 文件里面的rancherconfig 和 rancherCatalogconfig 分别对应指定的apikey,目前使用的是全局API
#全局API申请方式
########################################### 
请求:
curl -u "${CATTLE_ACCESS_KEY}:${CATTLE_SECRET_KEY}" \
-X POST \
-H 'Accept: application/json' \
-H 'Content-Type: application/json' \
-d '{"name":"hhy", "publicValue":""}' \
'http://rancherserverip:port/v1/apikey'
请求参数：
{
"name": "hhy"
}
不需要带accountId
#############################################