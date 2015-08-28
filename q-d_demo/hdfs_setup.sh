#!/bin/bash
unzip /home/dev/LAS_QnD_Dataset.zip
hadoop fs -mkdir -p wellbook
hadoop fs -put LAS_QnD_Dataset/* wellbook/
