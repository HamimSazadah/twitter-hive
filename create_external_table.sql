CREATE EXTERNAL TABLE `kfa_tweet`(
  id string COMMENT 'from deserializer', 
  id_str string COMMENT 'from deserializer', 
  text string COMMENT 'from deserializer', 
  created_at string COMMENT 'from deserializer', 
  user struct<id:string,id_str:string,screen_name:string,name:string,created_at:string,location:string,description:string,followers_count:int,friends_count:int,listed_count:int,statuses_count:int> COMMENT 'from deserializer', 
  favorite_count int COMMENT 'from deserializer', 
  entities struct<user_mentions:array<struct<id:string,screen_name:string,name:string>>,hashtags:array<struct<text:string>>,urls:array<struct<url:string,expanded_url:string,display_url:string>>> COMMENT 'from deserializer', 
  retweeted string COMMENT 'from deserializer', 
  source string COMMENT 'from deserializer', 
  in_reply_to_screen_name string COMMENT 'from deserializer', 
  retweet_count int COMMENT 'from deserializer', 
  coordinates struct<type:string,coordinates:array<double>> COMMENT 'from deserializer', 
  place struct<country_code:string,country:string,place_type:string,name:string,full_name:string,bounding_box:struct<type:string,coordinates:array<array<array<double>>>>> COMMENT 'from deserializer')
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
WITH SERDEPROPERTIES ( 
  'ignore.malformed.json'='true') 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hd-hdfs/user/hamim/tweet/'
