# Minimal SONiC Package Manager (spm) test package.
# spm only needs the image to exist and to carry the com.azure.sonic.manifest
# label; the container is never expected to do real work. busybox keeps it ~4 MB.
FROM busybox:1.36
ARG MANIFEST
LABEL com.azure.sonic.manifest=${MANIFEST}
CMD ["sleep", "infinity"]
