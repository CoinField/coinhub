FROM node:9

ENV HOME /app
ENV BITGO_ENV test

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install build-essential

RUN mkdir ${HOME}

WORKDIR ${HOME}

COPY ./package.json ./yarn.lock ./

RUN yarn install --production

COPY . .

USER node

EXPOSE 3080

CMD ["sh", "-c", "./bin/coinhub -b=127.0.0.1 -e=$BITGO_ENV -k=/app/k.key -c=/app/c.crt"]
