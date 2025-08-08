#!/bin/sh

# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

# ----------------------------------------------------------------------------
# Maven Wrapper Start Up Script
# ----------------------------------------------------------------------------

MAVEN_PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"

WRAPPER_JAR="${MAVEN_PROJECT_DIR}/.mvn/wrapper/maven-wrapper.jar"
WRAPPER_PROPERTIES="${MAVEN_PROJECT_DIR}/.mvn/wrapper/maven-wrapper.properties"

if [ -z "${JAVA_HOME}" ] ; then
  java_cmd=$(which java 2>/dev/null)
  if [ -n "${java_cmd}" ] && [ -x "${java_cmd}" ] ; then
    # resolve symlinks
    while [ -h "${java_cmd}" ] ; do
      ls=$(ls -ld "${java_cmd}")
      link=$(expr "$ls" : '.*-> \(.*\)$')
      if expr "$link" : '/.*' > /dev/null; then
        java_cmd="$link"
      else
        java_cmd="$(dirname "${java_cmd}")/$link"
      fi
    done
    # determine JAVA_HOME from location of java binary
    java_exe_dir=$(dirname "${java_cmd}")
    JAVA_HOME=$(cd "${java_exe_dir}/.." >/dev/null; pwd)
  fi
fi

if [ -f "${WRAPPER_PROPERTIES}" ]; then
  . "${WRAPPER_PROPERTIES}"
fi

if [ ! -f "${WRAPPER_JAR}" ] ; then
  if [ -n "${wrapperUrl}" ]; then
    echo "Downloading ${wrapperUrl}"
    if [ -n "`which curl`" ]; then
      curl -L -o "${WRAPPER_JAR}" "${wrapperUrl}"
    elif [ -n "`which wget`" ]; then
      wget -O "${WRAPPER_JAR}" "${wrapperUrl}"
    else
      echo "Neither curl nor wget found. Please install one."
      exit 1
    fi
  else
    echo "Error: wrapperUrl is not defined in ${WRAPPER_PROPERTIES}"
    exit 1
  fi
fi

if [ -z "${JAVA_HOME}" ] ; then
  echo "Error: JAVA_HOME is not defined correctly."
  exit 1
fi

"${JAVA_HOME}/bin/java" \
  ${MAVEN_OPTS} \
  -Dmaven.multiModuleProjectDirectory="${MAVEN_PROJECT_DIR}" \
  -cp "${WRAPPER_JAR}" \
  org.apache.maven.wrapper.MavenWrapperMain \
  "$@"

exit $?
