#!/bin/bash
echo `vim --version | head -n 1 | grep -oP '(?<=IMproved ).*?(?=\s)'`