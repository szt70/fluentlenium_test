#!/bin/bash
############################################
#
# desc :
#    Run FluentleniumTest
#
############################################
export LANG=en_US.UTF-8

cygwin=false
case "$(uname)" in
CYGWIN*) cygwin=true;;
esac

JAVA_HOME=/cygdrive/c/Program\ Files\ \(x86\)/Java/jre1.8.0_45/
JAVA=${JAVA_HOME}bin/java
MEMORY_OPTION=
GC_OPTION=
APP_ROOT=/cygdrive/d/dev/workspaces/fluentlenium/
CLASSES_DIR=${APP_ROOT}bin/
LIBRARY_DIR=${APP_ROOT}library/
LIB_DIR=${APP_ROOT}lib/
JAR_FILES=$(find ${LIB_DIR} -name '*.jar')
CLASSPATH=

for jarfile in ${CLASSES_DIR}
do
    CLASSPATH=${CLASSPATH}:${jarfile}
done

JAR_FILES=$(find ${LIBRARY_DIR} -name '*.jar')
for jarfile in ${JAR_FILES}
do
    CLASSPATH=${CLASSPATH}:${jarfile}
done

JAR_FILES=$(find ${LIB_DIR} -name '*.jar')
for jarfile in ${JAR_FILES}
do
    CLASSPATH=${CLASSPATH}:${jarfile}
done

if $cygwin;
then
  CLASSPATH=`cygpath -p -w $CLASSPATH`
fi

CLASS=fluentlenium.FluentleniumTest

"${JAVA}" -cp ${CLASSPATH} org.junit.runner.JUnitCore ${CLASS} "$@"