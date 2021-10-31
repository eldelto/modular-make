ifeq ($(BUILD_TYPE), test)
	SRC_FILES += ./src/payment-api/payment_stub.c
else
	SRC_FILES += ./src/payment-api/payment.c
endif
