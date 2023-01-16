FROM perl:latest

RUN apt-get update && \
    apt-get install -y gnuplot libhdf5-dev

RUN cpan PDL::IO::HDF5
RUN cpan Chart::Gnuplot
RUN cpan AutoLoader::AUTOLOAD
RUN cpan Text::CSV
RUN cpan PDL::Graphics::PLplot

COPY ./src/ /app/
WORKDIR /app

CMD ["perl", "script.pl"]
