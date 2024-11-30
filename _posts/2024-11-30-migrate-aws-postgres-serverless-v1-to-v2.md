---
layout: post
date: 2024-11-30 00:03:00 -0800
title: Migrate AWS Postgres Serverless V1 to V2
---

It's Thanksgiving holiday. Happy Thanksgiving to everyone! Hope you have a fantacy time with your family. In 2024 Thankgiving dinner time, we shared the thanks within my family. I appreciate my wife and my kids give me a great experience every day, happy or sad, sunny or rainy, together or separate, healthy or diseased, no matter what day it is. I will keep cherishing and enjoying every day.

In recent days, I need to set up the [MozartData Connector](https://help.mozartdata.com/docs/connectors) to connect our AWS RDS Postgres database. The MozartData is a easy way to build data warehouse based on [Snowflack](https://help.mozartdata.com/docs/faq) for startup. After trial and error, I noticed our current database is [AWS Postgress Serverless V1](https://repost.aws/questions/QUA99pHxHRRQ-l5EDeFXyVfA/how-to-check-what-version-of-aurora-serverless-i-have). You can find the difference between V1 and V2 from [here](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless-v2.upgrade.html#aurora-serverless.comparison). The serverless V1 doesn't support [logical replication](https://www.awesomescreenshot.com/image/51753334?key=fb2a2ac396dddff7fbe30f08e246ab22). To resolve the problem, I have to upgrade the V1 to V2. Actually you can find the [AWS official migration doc from v1 to v2](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless-v2.upgrade.html), but it's based on the AWS console and AWS Cli. The current project uses the [AWS Copilot Cli](https://aws.github.io/copilot-cli/) to set up the ECS, which means we have to use the AWS Copilot to manage all the settings.

After reading the [AWS Copilot doc](https://aws.github.io/copilot-cli/docs/developing/storage/), I think I could add a new storage addon, which uses Postgres serverless V2, then try to migrate the data from the existing V1 to the new V2. Let's dig into the details.

> [!NOTE]
> You may need to change some parameters in all commands in this doc.

### Copilot Sets Up Postgres Serverless V2
I have the existing postgress v1 for my service `api`, so the new `storage init` still adds storage to the same service, not environment. See more details about the difference from [AWS Copilot CLI: Storage](https://aws.github.io/copilot-cli/docs/developing/storage/). Below is the details command and interactive input for my setup.

```
❯ copilot storage init
Storage type: Aurora Serverless
Workload name: api
Storage resource name: api-cluster
Lifecycle:  Yes, the storage should be created and deleted at the same time as api
Database engine: PostgreSQL
Initial database name: worldex_backend
✔ Wrote CloudFormation template at copilot/api/addons/api-cluster.yml

Recommended follow-up actions:
  - Update api's code to leverage the injected environment variable APICLUSTER_SECRET.
    For example, in JavaScript you can write:
const {username, host, dbname, password, port} = JSON.parse(process.env.APICLUSTER_SECRET)

  - Run `copilot deploy --name api` to deploy your storage resources.
```

After the above command, a new addon, `copilot/api/addons/api-cluster.yml`, is added into my project. Then you can run below command to deploy the new storage.
```
copilot deploy --name api
```

The new storage will reuse the existing VPC settings, but the security group and database parameters config are different.

> [!NOTE]
> By default Copilot v1.34.0 uses Postgres engine 14.4. You need to change the `EngineVersion: '14.4'` to 16.2 and `Family: 'aurora-postgresql14'` to aurora-postgresql16 manually if you want to use the latest version 16.x. See https://github.com/aws/copilot-cli/pull/5862/files.

### Migrate V1 data to V2
Now another problem is migrate the existing data from v1 to the new v2. I ask ChatGPT how to resolve this problem. It provides different solutions.

- AWS Glue
- AWS Database Migration
- Postgres client cli `pg_dump` and `pg_restore`

> [!NOTE]
> ChatGTP is very helpful to answer all kinds of software engineering questions and it could provide high quality answer, which even more helpful than StackOverflow and Google. But sometime it provides some wrong answers. If you mention that answer is wrong, ChatGDP will admit the mistake very quickly and provides another wrong answer. This more happens when the product or the information is very limited in the internet, for example the [Retool](https://retool.com/) usages. In this case, Google is still your best friend.

After checking the AWS Glue and Database Migration home page, it's not straight forward for me to start. Checking the tutorial or quick start doc, it's still not in one page. The AWS Glue requires you use some JDBC setup and uploads the JDBC jar into S3 first. What? Why not set up everything by AWS and ask the user fill some database host? I could not stop complainting another AWS stupid UI. The AWS RDS Query Editor requries you fill the db connection information every time you use it. Why not save the connection? Google Cloud always pushes the employees to try to resolve the real customer problems, which should be the same to the AWS.

Now the `pg_dump` and `pg_restore` is the obvious best choice. My databases are in private VPC, so I have to set up [AWS bastion host EC2](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_GettingStartedAurora.CreatingConnecting.AuroraPostgreSQL.html). Then I install the postgres client cli via command:

```
sudo dnf install -y postgresql15
```

Then run `pg_dump` and `pg_restore` on your EC2 instance console.

```
# dump the prod db.
pg_dump -h {your_db_host} -p 5433 -U postgres -d {your_db_name} -F c -b -v -f database_dump.sql

# restore the schema and data. To restore data only add `--data-only` option.
pg_restore --host={your_db_host} --port=5432 -U postgres -d {your_db_name} -v database_dump.sql
```
