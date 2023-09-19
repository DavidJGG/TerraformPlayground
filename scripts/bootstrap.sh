#!/bin/bash
useradd -s /bin/bash -d /home/ansible -m ansible
echo "usuario creado"
echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/90-cloud-init-users
echo "no passd"
su ansible -c 'echo "cambio usr"'
su ansible -c 'mkdir /home/ansible/.ssh'
su ansible -c 'echo "dir ssh creado"'
su ansible -c 'chmod 700 /home/ansible/.ssh '
su ansible -c 'echo "chmod"'
su ansible -c 'echo "c3NoLXJzYSBBQUFBQjNOemFDMXljMkVBQUFBREFRQUJBQUFCZ1FER2Q0VU1IZ1hFTDlNc2pJOVd5
REZjL05EaGZNZGhQWHkvakNjN2Q1akROUzAxS1YzMVVLYzRSYm1WSVdLTVFUVEtIaUJwQVdybHVK
aXQ5RE5IaEJUWWdESS9wTXAyRWdQUXlxdDV1aEZRZXliNm80V0w3em13VGRld1B4K1lLTGcraE96
c0FMVUhMb09uNHdLcytlWFdTTlk5UlY3Ti9EOXVGV1J4bENlVmI4ZUlxNW1pNTY5T2xpcHBEVS9i
bnhXclBLZE9jZFNGd041Q1NvVGFENlVxWmtjcHB2SGdaM2hOUWJNbnh6OWJOVXdsWEE5OXh1YlBw
UXhHdm9mMi8xY2luNkdXTjZGODNTcXNrQjBPWG5QOU1TdzE0TlkxMGJNbXlnSzJST3lhUFhuYjR2
RXBsbXI5N2FRWnRlNUhtOU9XTUpnakdOUVQvM3dlQTJQY0FxWVJYUG5pdHVWS0I0Z0dEK05zVkp3
VFJpZlkvbHlHNXNLSCtxQzNuZjBiVm5hc2tkL0NpVnJ5SW5YVmQ4UDA5bDVlZzEwdjBFTEdGM1Jt
aStkNVBDNmd4SFFiUDRqYkhEVjMwaTlOMU1LUTdXUURSV0t1eERwWnQvbDh0elByRE11eVlRa3ZI
ekxRdGg1V0FUSXltQmNVUDNKSy9YODBsVFlGaFFCd2NDVGp0N2M9IGRnZ0BQQwo=" | base64 --decode >> /home/ansible/.ssh/authorized_keys'
su ansible -c 'chmod 600 /home/ansible/.ssh/authorized_keys'
su ansible -c 'echo "FINNNNN"'