#!/bin/bash
sudo grep -vE '^#|^$' /etc/ssh/sshd_config
