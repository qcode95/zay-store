package com.fpt.prj301.service;

import com.fpt.prj301.model.ProductSize;
import java.util.List;

public interface ProductSizeService {

    public List<ProductSize> GetProductSizeByCategory(int cId);
}
