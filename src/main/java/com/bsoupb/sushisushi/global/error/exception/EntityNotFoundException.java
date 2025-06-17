package com.bsoupb.sushisushi.global.error.exception;

import com.bsoupb.sushisushi.global.error.ErrorCode;

public class EntityNotFoundException extends BusinessException {

  public EntityNotFoundException(String message) {
    super(message, ErrorCode.PRODUCT_NOT_FOUND);
  }

  public EntityNotFoundException(ErrorCode errorCode) {
    super(ErrorCode.PRODUCT_NOT_FOUND);
  }
}

