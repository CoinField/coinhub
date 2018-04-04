FROM node:9

ENV HOME /app
ENV BITGO_ENV prod
ENV KEY /app/k.key
ENV CRT /app/c.crt
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install build-essential
RUN mkdir ${HOME}

WORKDIR ${HOME}

COPY ./package.json ./yarn.lock ./

RUN yarn install --production

COPY . .

USER node

EXPOSE 3080
#CMD ["/bin/sh", "-c", "./bin/coinhub -b=0.0.0.0 -e=$BITGO_ENV -k=$KEY -c=$CRT"]
CMD ["/bin/sh", "-c", "#(nop) ", "CMD ["sh" "-c" "./bin/coinhub -b=0.0.0.0 -e=$BITGO_ENV  -k=$KEY -c=$CRT"]"]
