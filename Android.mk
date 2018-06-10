LOCAL_PATH := $(call my-dir)

ifneq (,$(filter vivalto3gvn,$(TARGET_DEVICE)))
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
