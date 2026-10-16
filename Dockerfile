# PostgREST for Railway.
# The upstream image is scratch-based (no shell), so a start command cannot export
# variables. Literal settings are baked here so no template variable needs a literal
# default (templateGenerate publishes literals as blank required fields).
# PostgREST ignores $PORT; Railway's healthcheck dials the injected 8080, so bind it.
FROM postgrest/postgrest:v16.4@sha256:d155c6718ed9a9f990d159a2ab7c0a3f16944dbb6d0a0344557421042acfe0df

ENV PGRST_SERVER_HOST=* \
    PGRST_SERVER_PORT=8080 \
    PGRST_DB_SCHEMAS=public \
    PGRST_DB_ANON_ROLE=anon
