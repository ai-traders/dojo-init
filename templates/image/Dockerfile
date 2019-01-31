FROM debian:9.6-slim

# Install Dojo image scripts
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends\
  sudo git ca-certificates && \
  git clone --depth 1 -b ${TODO_REPLACE_dojo_version} ${TODO_REPLACE_dojo_git_url} /tmp/dojo_git && \
  /tmp/dojo_git/image_scripts/src/install.sh && \
  rm -r /tmp/dojo_git && \
  echo 'dojo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD ["/bin/bash"]

COPY profile /home/dojo/.profile
COPY bashrc /home/dojo/.bashrc
COPY inputrc /etc/inputrc

# Install custom Dojo scripts
COPY etc_dojo.d/scripts/* /etc/dojo.d/scripts/
# uncomment if needed:
# COPY etc_dojo.d/variables/* /etc/dojo.d/variables/
