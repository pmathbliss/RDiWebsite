<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
    <xsl:for-each select="Inventory/Style">
    
  <div class="col-md-3 col-sm-6 product">
      <xsl:variable name="minPrice" select="(Item)[1]/@RegPrice"/>
      <xsl:variable name="minSalePrice" select="(Item)[1]/@SalePrice"/>
      <xsl:variable name="diff" select="$minPrice - $minSalePrice"/>
      <xsl:variable name="isOnSale" select="($minSalePrice &gt; 0) and ($minSalePrice &lt; $minPrice)"/>
      <xsl:variable name="sellWhen" select="@Avail"/>     
      <xsl:attribute name="data-productname">
        <xsl:value-of select="@ProductName"/>
      </xsl:attribute>   
      <xsl:attribute name="data-longdesc">
        <xsl:value-of select="@LongDesc"/>
      </xsl:attribute>
      <xsl:attribute name="data-sku">
        <xsl:value-of select="@Desc2"/>
      </xsl:attribute>
     
      <xsl:attribute name="avail">
        <xsl:value-of select="$sellWhen"/>
      </xsl:attribute>
      <xsl:attribute name="productId">
        <xsl:value-of select="@StyleSID"/>
      </xsl:attribute>
      <div class="product-grid">
          <div class="product-image">
              <a href="#" >                
                  <img class="pic-1" src="http://bestjquery.com/tutorial/product-grid/demo3/images/img-3.jpeg"/>
                  <img class="pic-2" src="http://bestjquery.com/tutorial/product-grid/demo3/images/img-4.jpeg"/>
              </a>
              <ul class="social">
                  <li><a href="" data-tip="Quick View"><i class="fa fa-search"></i></a></li>
                  <li><a href="" data-tip="Add to Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                  <li><a href="" data-tip="Add to Cart"><i class="fa fa-shopping-cart"></i></a></li>
              </ul>
              <xsl:choose>
                <xsl:when test="$isOnSale"> 
                  <span class="product-new-label">Sale</span>
                  <span class="product-discount-label"><xsl:value-of select="($diff div $minPrice)*100"/>%</span>
                </xsl:when>
              </xsl:choose>
          </div>
          <ul class="rating">
              <li class="fa fa-star"></li>
              <li class="fa fa-star"></li>
              <li class="fa fa-star"></li>
              <li class="fa fa-star"></li>
              <li class="fa fa-star disable"></li>
          </ul>
          <div class="product-content">
              <h3 class="title"><a href="#" onclick="openProduct(this);"><xsl:value-of select="@ProductName"/></a></h3>
              <div class="sku"><xsl:value-of select="@Desc2"/></div>
              <div class="price">              
                <xsl:choose>
                  <xsl:when test="$isOnSale">$<xsl:value-of select="$minSalePrice"/>
                    <span>$<xsl:value-of select="$minPrice"/></span>
                  </xsl:when>
                  <xsl:otherwise>$<xsl:value-of select="$minPrice"/>
                  </xsl:otherwise>
                </xsl:choose>
              </div>   
              <div class="options ">             
                <h5 for="options">Options</h5>
                <select class="custom-select" name="options" onchange="optionSelected(this);" >            
                  <xsl:for-each select="Item">  
                    <xsl:sort select="@Attr" /> 
                    <xsl:sort select="@SizeOrder" />           
                    <option>                
                      <xsl:attribute name="item_sid">
                        <xsl:value-of select="@ItemSID"/>
                      </xsl:attribute>  
                      <xsl:attribute name="id">
                        <xsl:value-of select="@ItemSID"/>
                      </xsl:attribute>                              
                      <xsl:attribute name="price">
                        <xsl:value-of select="@RegPrice"/>
                      </xsl:attribute>                        
                      <xsl:attribute name="saleprice">
                        <xsl:value-of select="@SalePrice"/>
                      </xsl:attribute>  
                      <xsl:attribute name="value">
                        <xsl:value-of select="@ALU"/>
                      </xsl:attribute>
                      <xsl:attribute name="quantity">
                        <xsl:value-of select="@Quantity"/>
                      </xsl:attribute>
                      <em class="attr"> <xsl:value-of select="@Attr"/> </em>
                      <em class="size"> <xsl:value-of select="@Size"/> </em> <xsl:choose>
                        <xsl:when test="@Quantity > 0"> <em> (In Stock) </em>
                        </xsl:when>
                        <xsl:otherwise> <em> (Out of Stock) </em>
                        </xsl:otherwise>
                      </xsl:choose>  
                    </option>
                  </xsl:for-each>
                </select>
              </div>
              <button class="btn btn-light add-to-cart" title="Add to Cart"> Add To Cart</button>
          </div>
      </div>
  </div>

    </xsl:for-each>
</xsl:template>
</xsl:stylesheet>