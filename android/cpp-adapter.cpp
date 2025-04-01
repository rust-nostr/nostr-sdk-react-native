#include <jni.h>
#include "nostr-sdk-react-native.h"

extern "C"
JNIEXPORT jdouble JNICALL
Java_com_nostrsdkreactnative_NostrSdkReactNativeModule_nativeMultiply(JNIEnv *env, jclass type, jdouble a, jdouble b) {
    return nostrsdkreactnative::multiply(a, b);
}
