# Systemd basic usage

sudo systemctl start application.service
sudo systemctl stop application.service
sudo systemctl restart application.service
sudo systemctl reload application.service
sudo systemctl reload-or-restart application.service
sudo systemctl enable application.service
sudo systemctl disable application.service
systemctl status application.service

systemctl is-active application.service
systemctl is-enabled application.service
systemctl is-failed application.service

systemctl list-units application.service
