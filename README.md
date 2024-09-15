BME280 on Raspi, as a prometheus exporter.

```
cd /usr/local
git clone https://github.com/mschmitt/pybme280.git
make -C pybme280
. pybme280/bin/activate
pybme280/bin/bme280
```

Telegraf: https://docs.influxdata.com/telegraf/v1/install/

```
# /etc/telegraf/telegraf.d/prometheus-exporter.conf
[[inputs.execd]]
interval = '10s'
command = ['/usr/local/pybme280/bin/python3', '/usr/local/pybme280/bin/bme280']
tag_keys = ['port', 'address']
signal = 'STDIN'
data_format = 'json'
name_suffix = '_bme280'

[[outputs.prometheus_client]]
listen = "[::]:9274"
collectors_exclude = ["gocollector", "process"]
expiration_interval = "60s"
```
