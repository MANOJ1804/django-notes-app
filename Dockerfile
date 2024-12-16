FROM ubuntu:14.04
LABEL name="learning-ocean"
LABEL email="[email protected]"
RUN apt-get update && apt-get install -y python tree
ENTRYPOINT ["tree"]
