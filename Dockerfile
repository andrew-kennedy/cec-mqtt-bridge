FROM docker.io/balenalib/raspberrypi4-64-debian-python:latest-bookworm-build

# This balena image doesn't seem to have pip properly configured, so install it here.
RUN install_packages libcec6 libcec-dev python3-cec python3-paho-mqtt python3-pip

WORKDIR /usr/src/app
COPY requirements.txt ./

RUN python -m venv --system-site-packages .
RUN ./bin/pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "./bin/python", "./bridge.py" ]
