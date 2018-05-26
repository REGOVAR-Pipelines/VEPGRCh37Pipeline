# Start with a minimal Docker image
FROM scratch

# Copy the pipeline scripts from the ouside of the container into the container
COPY run.sh /

# Use root in the container to make the script exectuable
USER root
RUN chmod +x /run.sh
RUN mkdir -p /regovar/{inputs,outputs,logs,databases}

# Run the pipeline
CMD ["/run.sh"]