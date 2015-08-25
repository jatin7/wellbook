#!/bin/bash
unzip LAS_Q&D_Dataset.zip
hadoop fs -mkdir -p wellbook
hadoop fs -put LAS_Q&D_Dataset/* wellbook/
