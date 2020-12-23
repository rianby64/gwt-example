
FROM centos as gwt

RUN yum install -y unzip.x86_64 mesa-libGL.x86_64 mesa-dri-drivers.x86_64 libXrender.x86_64 libXtst.x86_64 xorg-x11-fonts-100dpi.noarch xorg-x11-fonts-75dpi.noarch xorg-x11-fonts-ISO8859-1-100dpi.noarch xorg-x11-fonts-ISO8859-1-75dpi.noarch xorg-x11-fonts-ISO8859-14-100dpi.noarch xorg-x11-fonts-ISO8859-14-75dpi.noarch xorg-x11-fonts-ISO8859-15-100dpi.noarch xorg-x11-fonts-ISO8859-15-75dpi.noarch xorg-x11-fonts-ISO8859-2-100dpi.noarch xorg-x11-fonts-ISO8859-2-75dpi.noarch xorg-x11-fonts-ISO8859-9-100dpi.noarch xorg-x11-fonts-ISO8859-9-75dpi.noarch xorg-x11-fonts-Type1.noarch xorg-x11-fonts-cyrillic.noarch xorg-x11-fonts-ethiopic.noarch xorg-x11-fonts-misc.noarch wget.x86_64
RUN wget https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.9.1%2B1/OpenJDK11U-jdk_x64_linux_hotspot_11.0.9.1_1.tar.gz
RUN wget https://storage.googleapis.com/gwt-releases/gwt-2.9.0.zip
RUN wget https://downloads.apache.org/ant/binaries/apache-ant-1.10.9-bin.tar.gz

RUN tar xvzf OpenJDK11U-jdk_x64_linux_hotspot_11.0.9.1_1.tar.gz
RUN tar xvzf apache-ant-1.10.9-bin.tar.gz
RUN unzip gwt-2.9.0.zip

RUN mv jdk-11.0.9.1+1 .java
RUN mv apache-ant-1.10.9 .ant
RUN mv gwt-2.9.0 gwt

ENV JDK_HOME=${HOME}/.java
ENV JAVA_HOME=${HOME}/.java
ENV PATH=${PATH}:${JAVA_HOME}/bin
ENV ANT_HOME=${HOME}/.ant
ENV PATH=${PATH}:${ANT_HOME}/bin

WORKDIR /gwt
