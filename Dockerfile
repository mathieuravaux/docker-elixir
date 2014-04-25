FROM ubuntu:saucy
MAINTAINER Peter Ericson <pdericson@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get upgrade -y && apt-get clean && rm -fr /var/cache/apt/archives/*

RUN apt-get install -y unzip wget

# erlang
RUN wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && dpkg -i erlang-solutions_1.0_all.deb && apt-get update && apt-get install -y erlang

# elixir
RUN cd /usr/local && wget https://github.com/elixir-lang/elixir/releases/download/v0.13.0/Precompiled.zip && unzip Precompiled.zip

# rebar
RUN cd /usr/local/bin && wget https://github.com/rebar/rebar/wiki/rebar && chmod +x rebar

# cleanup
RUN apt-get clean && rm -fr /var/cache/apt/archives/* /var/lib/apt/lists/*

CMD ["erl"]
