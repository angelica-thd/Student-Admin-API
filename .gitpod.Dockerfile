FROM gitpod/workspace-postgres
USER gitpod

ENV POSTGRES_DB='student-admin-api_production'
ENV POSTGRES_USER = 'postgres'
ENV POSTGRES_PASSWORD = 'postgresqlserver'
ENV RAILS_ENV='production'
ENV RACK_ENV='production'


# Install the Ruby version specified in '.ruby-version'
COPY --chown=gitpod:gitpod .ruby-version /tmp
RUN echo "rvm_gems_path=/home/gitpod/.rvm" > ~/.rvmrc
RUN bash -lc "rvm install ruby-$(cat /tmp/.ruby-version) && rvm use ruby-$(cat /tmp/.ruby-version) --default"
RUN echo "rvm_gems_path=/workspace/.rvm" > ~/.rvmrc
