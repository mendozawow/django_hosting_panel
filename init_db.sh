#!/bin/bash
sleep 5
mysql -u root -p  "CREATE DATABASE hosting_panel"
mysql -u root hosting_panel < hosting_panel.sql
