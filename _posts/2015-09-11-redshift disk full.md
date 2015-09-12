---
layout: post
date: 2015-09-11 22:45:44 -0700
title: redshift disk full
---

Today fail to copy data from s3 json file to redshift, check the stl_error and stl_load_errors tables, I find some error like "disk full error". Also I check the redshift aws console, I find the Percentage of Disk Usage is 100%.

From the aws console, click Performance tab page, there are some queries are displayed. One of them is running 24 hours, and since it was running the disk usage increased until 100%. The query used 5 joins on same table, which contains 100k rows. It uses a lot disk space because the memory cannot support that query.

The way to solve it is terminate that query first, select that query in Performance page, and click it, the Query tab is displayed and you can terminate that query now. Then run `vacuum {your_table_name}`, see more [here](http://docs.aws.amazon.com/redshift/latest/dg/r_VACUUM_command.html)