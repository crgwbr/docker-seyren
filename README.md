docker-seyren
=============

A dockerized [Seyren](https://github.com/scobal/seyren) container that runs a a non-root user.

## Usage

```
# Run MongoDB
docker run -d --name mongodb mongo:3.0.1

# Run Seyren and link MongoDB
docker run -d -p 8080:8080 --name seyren --link mongodb:mongodb -it crgwbr/seyren http://[GRAPHITE_URL]

# Run Seyren and link MongoDB using environment variable for graphite URL
docker run -d -p 8080:8080 --name seyren --link mongodb:mongodb -e GRAPHITE_URL=http://[GRAPHITE_URL] -it crgwbr/seyren

## Building

To build the image, simply invoke

    docker build github.com/crgwbr/docker-seyren

A prebuilt container is also available in the docker index

    docker pull crgwbr/seyren

## Author

  * Usman Ismail (<usman@techtraits.com>)
  * Craig Weber (<crgwbr@gmail.com>)

## LICENSE

Copyright 2014 Usman Ismail

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
