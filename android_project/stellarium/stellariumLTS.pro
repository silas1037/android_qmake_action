
#build dir is on build/ (translations dir need)
#build .so with cmakelists.txt and copy libstelMain_armeabi-v7a.so into ../libsShare
#build this


STEL=../..
DESTDIR     = ../libsShare


DEFINES += \
#STELLARIUM_SOURCE_DIR=\\\"G:\\\\Stellarium\\\\TRACK\\\\stellarium\\\" \
STELLARIUM_URL=\\\"https://stellarium.org/\\\" \
COPYRIGHT_YEARS=\\\"2000-2020\\\" \
PACKAGE_VERSION=\\\"0.20.3\\\" \
#        STELLARIUM_MAJOR=0 \
#        STELLARIUM_MINOR=20 \
#        STELLARIUM_PATCH=3

###################

TEMPLATE = app

#TARGET = stellarium

CONFIG  += c++11 qt thread

QT += core network gui sensors qml quick positioning concurrent \
        widgets script multimedia multimediawidgets serialport printsupport opengl

LIBS += -L$$DESTDIR -lz

android {
        QT += androidextras
        ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
        ANDROID_PACKAGE            = org.stellarium.LTS
        ANDROID_APP_NAME           = Stellarium LTS
        assets.path    = /assets/
        assets.files   = \
        $$STEL/data 
		
        INSTALLS += assets
        ANDROID_EXTRA_LIBS += $$files( $$DESTDIR/*.so , true )
        ANDROID_ABIS = armeabi-v7a
}

###################

SOURCES += \
        $$STEL/src/main.cpp


