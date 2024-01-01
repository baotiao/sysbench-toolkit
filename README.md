# sysbench-toolkit



**Introduction**
This repository contains a collection of performance benchmarks for different industries. The goal is to provide a more accurate and realistic assessment of database performance in real-world applications.

**Background**

Traditionally, sysbench is used to benchmark database performance. However, sysbench is designed to simulate a generic workload, which may not be representative of the specific needs of a particular industry. For example, the TPCC benchmark, which is one of the most popular benchmarks for simulating business workloads, is designed to model an online order processing system. This workload is not representative of the needs of industries such as gaming, e-education, or SaaS.

In the gaming industry, for example, databases are often used to store large amounts of data, such as character equipment information. In this case, the performance of the database may be limited by the ability to update large blob fields. In the e-education industry, databases are often used to support hot updates, such as when students are registering for classes. In this case, the performance of the database may be limited by the ability to handle hot spots. In the SaaS industry, databases are often used to support multiple tables and indexes for each customer. In this case, the performance of the database may be limited by the ability to support complex queries.

**Benchmarks**
The benchmarks in this repository are designed to cover a wide range of industry-specific workloads. The benchmarks include the following:

Gaming: This benchmark simulates the workload of a gaming database, which includes operations such as storing character equipment information, updating character statistics, and performing item transactions.
E-education: This benchmark simulates the workload of an e-education database, which includes operations such as registering students for classes, tracking student progress, and issuing grades.
SaaS: This benchmark simulates the workload of a SaaS database, which includes operations such as creating and managing customer accounts, storing customer data, and processing customer transactions.

**Future work**

The goal is to continue to add new benchmarks to this repository to cover a wider range of industry-specific workloads. The benchmarks should also be updated regularly to reflect the latest trends in database technology.



**Conclusion**
This repository provides a valuable resource for database administrators and developers who need to evaluate the performance of their systems in real-world applications. The benchmarks in this repository are more accurate and realistic than traditional benchmarks, such as sysbench and TPCC.




--------



### USAGE

**Game**



game_blob_update.lua

Gaming industry update field scenario, table structure as follows:

```
mysql> show create table user_data1\G
*************************** 1. row ***************************
       Table: user_data1
Create Table: CREATE TABLE `user_data1` (
  `uid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data` mediumblob NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
1 row in set (0.00 sec)
```




**Saas**



saas_multi_index.lua

In the SaaS industry, in a multi-index scenario, table structure as follows:

```
mysql> show create table saas_log1\G
*************************** 1. row ***************************
       Table: saas_log1
Create Table: CREATE TABLE `saas_log1` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `saas_type` varchar(64) DEFAULT NULL,
  `saas_currency_code` varchar(3) DEFAULT NULL,
  `saas_amount` bigint(20) DEFAULT '0',
  `saas_direction` varchar(2) DEFAULT 'NA',
  `saas_status` varchar(64) DEFAULT NULL,
  `saas_status_remarks` varchar(200) DEFAULT NULL,
  `ewallet_ref` varchar(64) DEFAULT NULL,
  `merchant_ref` varchar(64) DEFAULT NULL,
  `third_party_ref` varchar(64) DEFAULT NULL,
  `created_date_time` datetime DEFAULT NULL,
  `updated_date_time` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `saas_date_time` datetime DEFAULT NULL,
  `original_saas_ref` varchar(64) DEFAULT NULL,
  `source_of_fund` varchar(64) DEFAULT NULL,
  `external_saas_type` varchar(64) DEFAULT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `merchant_id` varchar(64) DEFAULT NULL,
  `merchant_id_ext` varchar(64) DEFAULT NULL,
  `mfg_no` varchar(64) DEFAULT NULL,
  `rfid_tag_no` varchar(64) DEFAULT NULL,
  `payment_info` text,
  `extend_info` text,
  `admin_fee` bigint(20) DEFAULT NULL,
  `ppu_type` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63710 DEFAULT CHARSET=utf8
1 row in set (0.00 sec)
```

