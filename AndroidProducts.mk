#
# AndroidProducts.mk for Redmi Note 12 Pro 5G (ruby)
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/fox_ruby.mk \
    $(LOCAL_DIR)/twrp.mk

COMMON_LUNCH_CHOICES := \
    fox_ruby-eng \
    fox_ruby-userdebug \
    twrp_ruby-eng \
    twrp_ruby-userdebug
