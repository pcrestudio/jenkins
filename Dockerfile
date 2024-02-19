# Usa una imagen base de Jenkins LTS
FROM jenkins/jenkins:lts

# Establece el usuario para evitar problemas de permisos
USER root

# Actualiza el sistema e instala herramientas adicionales si es necesario
RUN apt-get update && \
    apt-get install -y \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Configura Jenkins con la configuración que desees (copiando archivos de configuración, scripts, etc.)
# Ejemplo:
# COPY config.xml /var/jenkins_home/config.xml

# Establece permisos apropiados
RUN chown -R jenkins:jenkins /var/jenkins_home

# Cambia de nuevo al usuario de Jenkins
USER jenkins