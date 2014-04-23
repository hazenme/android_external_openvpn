LOCAL_PATH:= $(call my-dir)

#on a 32bit maschine run ./configure --enable-password-save --disable-pkcs11 --with-ifconfig-path=/system/bin/ifconfig --with-route-path=/system/bin/route
#from generated Makefile copy variable contents of openvpn_SOURCES to common_SRC_FILES
# append missing.c to the end of the list
# missing.c defines undefined functions.
# in tun.c replace /dev/net/tun with /dev/tun

common_SRC_FILES:= \
	src/openvpn/base64.c src/openvpn/base64.h \
	src/openvpn/basic.h \
	src/openvpn/buffer.c src/openvpn/buffer.h \
	src/openvpn/circ_list.h \
	src/openvpn/common.h \
	src/openvpn/crypto.c src/openvpn/crypto.h \
	src/openvpn/dhcp.c src/openvpn/dhcp.h \
	src/openvpn/errlevel.h \
	src/openvpn/error.c src/openvpn/error.h \
	src/openvpn/event.c src/openvpn/event.h \
	src/openvpn/fdmisc.c src/openvpn/fdmisc.h \
	src/openvpn/forward.c src/openvpn/forward.h src/openvpn/forward-inline.h \
	src/openvpn/fragment.c src/openvpn/fragment.h \
	src/openvpn/gremlin.c src/openvpn/gremlin.h \
	src/openvpn/helper.c src/openvpn/helper.h \
	src/openvpn/httpdigest.c src/openvpn/httpdigest.h \
	src/openvpn/lladdr.c src/openvpn/lladdr.h \
	src/openvpn/init.c src/openvpn/init.h \
	src/openvpn/integer.h \
	src/openvpn/interval.c src/openvpn/interval.h \
	src/openvpn/list.c src/openvpn/list.h \
	src/openvpn/lzo.c src/openvpn/lzo.h \
	src/openvpn/manage.c src/openvpn/manage.h \
	src/openvpn/mbuf.c src/openvpn/mbuf.h \
	src/openvpn/memdbg.h \
	src/openvpn/misc.c src/openvpn/misc.h \
	src/openvpn/mroute.c src/openvpn/mroute.h \
	src/openvpn/mss.c src/openvpn/mss.h \
	src/openvpn/mtcp.c src/openvpn/mtcp.h \
	src/openvpn/mtu.c src/openvpn/mtu.h \
	src/openvpn/mudp.c src/openvpn/mudp.h \
	src/openvpn/multi.c src/openvpn/multi.h \
	src/openvpn/ntlm.c src/openvpn/ntlm.h \
	src/openvpn/occ.c src/openvpn/occ.h src/openvpn/occ-inline.h \
	src/openvpn/pkcs11.c src/openvpn/pkcs11.h \
	src/openvpn/openvpn.c src/openvpn/openvpn.h \
	src/openvpn/openvpn-plugin.h \
	src/openvpn/options.c src/openvpn/options.h \
	src/openvpn/otime.c src/openvpn/otime.h \
	src/openvpn/packet_id.c src/openvpn/packet_id.h \
	src/openvpn/perf.c src/openvpn/perf.h \
	src/openvpn/pf.c pf.h src/openvpn/pf-inline.h \
	src/openvpn/ping.c src/openvpn/ping.h src/openvpn/ping-inline.h \
	src/openvpn/plugin.c src/openvpn/plugin.h \
	src/openvpn/pool.c src/openvpn/pool.h \
	src/openvpn/proto.c src/openvpn/proto.h \
	src/openvpn/proxy.c src/openvpn/proxy.h \
	src/openvpn/ps.c src/openvpn/ps.h \
	src/openvpn/push.c src/openvpn/push.h \
	src/openvpn/pushlist.h \
	src/openvpn/reliable.c src/openvpn/reliable.h \
	src/openvpn/route.c src/openvpn/route.h \
	src/openvpn/schedule.c src/openvpn/schedule.h \
	src/openvpn/session_id.c src/openvpn/session_id.h \
	src/openvpn/shaper.c src/openvpn/shaper.h \
	src/openvpn/sig.c src/openvpn/sig.h \
	src/openvpn/socket.c src/openvpn/socket.h \
	src/openvpn/socks.c src/openvpn/socks.h \
	src/openvpn/ssl.c src/openvpn/ssl.h \
	src/openvpn/status.c src/openvpn/status.h \
	src/openvpn/syshead.h \
	src/openvpn/tun.c src/openvpn/tun.h \
	src/openvpn/win32.h src/openvpn/win32.c \
	src/openvpn/cryptoapi.h src/openvpn/cryptoapi.c \
	src/openvpn/missing.c \
	android.c android.h

common_CFLAGS += -DANDROID_CHANGES

common_C_INCLUDES += \
	external/openssl \
	external/openssl/include \
	external/openssl/crypto \
	external/lzo/include \
	system/security/keystore

common_SHARED_LIBRARIES := libcutils libkeystore_binder

ifneq ($(TARGET_SIMULATOR),true)
	common_SHARED_LIBRARIES += libdl
endif

# static linked binary
# =====================================================

#include $(CLEAR_VARS)
#LOCAL_SRC_FILES:= $(common_SRC_FILES)
#LOCAL_CFLAGS:= $(common_CFLAGS)
#LOCAL_C_INCLUDES:= $(common_C_INCLUDES)
#
#LOCAL_SHARED_LIBRARIES += $(common_SHARED_LIBRARIES)
#LOCAL_STATIC_LIBRARIES:= libopenssl-static liblzo-static
#
##LOCAL_LDLIBS += -ldl
##LOCAL_PRELINK_MODULE:= false
#
#LOCAL_MODULE:= openvpn-static
#LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
#include $(BUILD_EXECUTABLE)

# dynamic linked binary
# =====================================================

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= $(common_SRC_FILES)
LOCAL_CFLAGS:= $(common_CFLAGS)
LOCAL_C_INCLUDES:= $(common_C_INCLUDES)

LOCAL_SHARED_LIBRARIES:= $(common_SHARED_LIBRARIES) libssl libcrypto liblzo

#LOCAL_LDLIBS += -ldl
#LOCAL_PRELINK_MODULE:= false

LOCAL_MODULE_TAGS := optional
LOCAL_MODULE:= openvpn
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
include $(BUILD_EXECUTABLE)
