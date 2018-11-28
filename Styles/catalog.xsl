<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <a class="navbar-brand" href="#">Home</a>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <xsl:for-each select="catalog/category">
                    <xsl:variable name="parentName" select="@name"/>                    
                    <li >  
                        
                        <xsl:attribute name="id"><xsl:value-of select="@catalog_id"/></xsl:attribute>                     
                        <xsl:attribute name="class">nav-item <xsl:choose>
                                <xsl:when test="((category)[1]/@catalog_id &gt; 0)"> dropdown </xsl:when>
                            </xsl:choose>
                        </xsl:attribute>                      
                        <xsl:attribute name="style">
                            <xsl:choose>
                                <xsl:when test="@unpublished = 'True'"> 
                                    display:none
                                </xsl:when>
                            </xsl:choose>
                        </xsl:attribute>
                        <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="clickCategory(this);">
                            <xsl:attribute name="class">nav-link <xsl:choose>
                                    <xsl:when test="(category)[1]/@catalog_id &gt; 0 "> dropdown-toggle </xsl:when>
                                </xsl:choose>
                            </xsl:attribute>
                            <xsl:attribute name="href">#<xsl:choose>
                                    <xsl:when test="(category)[1]/@catalog_id &gt; 0 ">/<xsl:value-of select="$parentName"/>&amp;catalog_id=<xsl:value-of select="@catalog_id"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:attribute>
                            <xsl:attribute name="id">navbarDropdownMenuLink<xsl:value-of select="@catalog_id"/>
                            </xsl:attribute>
                            <xsl:attribute name="data-categoryname"><xsl:value-of select="@name"/></xsl:attribute>
                            <xsl:attribute name="data-categoryid"><xsl:value-of select="@catalog_id"/></xsl:attribute>
                            <xsl:value-of select="$parentName"/>
                            <span class="sr-only">(current)</span>
                        </a>                            
                        <products style="display:none;">
                            <xsl:attribute name="id"><xsl:value-of select="@catalog_id"/></xsl:attribute>
                            <xsl:for-each select="descendant-or-self::product">
                                <item><xsl:attribute name="data-sortorder"><xsl:value-of select="@sort_order"/></xsl:attribute><xsl:value-of select="@style_sid"/></item>
                            </xsl:for-each>
                        </products>
                        <div class="dropdown-menu" >                        
                            <xsl:attribute name="aria-labelledby">navbarDropdownMenuLink<xsl:value-of select="@catalog_id"/>
                            </xsl:attribute>
                            <xsl:for-each select="category"> 
                                <a class="dropdown-item" href="#">
                                    <xsl:variable name="currentName" select="@name"/> 
                                    <xsl:attribute name="href">#/<xsl:value-of select="$parentName"/>/<xsl:value-of select="$currentName"/>&amp;catalog_id=<xsl:value-of select="@catalog_id"/>
                                    </xsl:attribute>                               
                                    <xsl:attribute name="id">
                                        <xsl:value-of select="@catalog_id"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="$currentName"/>
                                </a>                                                    
                                <products style="display:none;">
                                    <xsl:attribute name="id"><xsl:value-of select="@catalog_id"/></xsl:attribute>
                                    <xsl:for-each select="descendant-or-self::product">
                                        <item><xsl:attribute name="data-sortorder"><xsl:value-of select="@sort_order"/></xsl:attribute><xsl:value-of select="@style_sid"/></item>
                                    </xsl:for-each>
                                </products>
                            </xsl:for-each>
                        </div>
                    </li>
                </xsl:for-each>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search"/>
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </xsl:template>
</xsl:stylesheet>