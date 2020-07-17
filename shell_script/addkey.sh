#!/bin/bash
echo "Begin"
echo "============================================"

key="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCW7FDrrORzpeuUD7VlienQoB01TRtK5kHxI/RJ3LiOXEYV1LznNaPOYpaAYJPygkiB8G0FsAF0lY7f+7SDJN0SZWD643U2M3ERP9b9XdXRCBZZxvsWs/M7bB/F7Qp9XzdDLh9N6oUKrformoTvrOpofbXGifg1lTk2kUk2q9cRbIEk4DuRiUeeiKfl3HawGnxmPk+o9X9X29Jo5pDV7brNTcrnVYaE7UUi7A4uWUk6huTWwsYuyuBov4SIIOD4pcr7fcOrSJ+bJ66YTxb8xmDzTqFQDtNpS1yfmP1s5lOsExnm7CDyNj5gsm2g6hU9er3VD2hnuKvCwrOFI9KeYGFp"

echo $key >> /home/ec2-user/.ssh/authorized_keys
cat /home/ec2-user/.ssh/authorized_keys

echo "============================================"
echo "End"
