QT += testlib
QT += gui widgets

CONFIG += qt testcase

TEMPLATE = app

CONFIG(debug, debug|release) {
    DESTDIR = $${PWD}/../build/Debug
} else {
    DESTDIR = $${PWD}/../build/Release
}
LIBS += -L$${DESTDIR}

!isEmpty(CASENAME) {
    DEFINES += CASENAME=\\\"'$$CASENAME'\\\"
    TARGET = $$CASENAME

    TESTDATA = $${PWD}/../TestData
    DEFINES += TESTDATA=\\\"'$$TESTDATA'\\\"
    win32:TESTDATA ~= s,/,\\,g
    !exists($$TESTDATA): system($$QMAKE_MKDIR $$TESTDATA)
}

