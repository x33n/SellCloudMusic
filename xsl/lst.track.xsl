<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="tracks">
        <script type="text/javascript" src="js/frm.track.js"></script>
        <script type="text/javascript" src="js/lst.track.js"></script>        
        <div id="track-list">
            <xsl:apply-templates match="track"/>
        </div>
        <div id="track-panel">
            <div id="track-info"/>
            <div id="track-edit"/>
        </div>
    </xsl:template>
    <xsl:template match="/tracks/track">
        <div>
            <xsl:attribute name="class">track-label<xsl:if test="import-id != 0"> track-imported</xsl:if>
            </xsl:attribute>
            <xsl:attribute name="data-import-track-id">
                <xsl:value-of select = "number(import-id)"/>
            </xsl:attribute>
            <xsl:attribute name="data-import-user-id">
                <xsl:value-of select = "import-user-id"/>
            </xsl:attribute>            
            <xsl:attribute name="data-user-id">
                <xsl:value-of select = "user-id"/>
            </xsl:attribute>
            <xsl:attribute name="data-track-id">
                <xsl:value-of select = "id"/>
            </xsl:attribute>
            <xsl:value-of select="title"/>
            <xsl:if test="count-orders &gt; 0">
            <span class="count-orders" title="Number of orders">
                <xsl:value-of select="count-orders"/>
            </span>
            </xsl:if>
            <xsl:if test="exclusive = 2">
                <div class="image-exclusive" title="Track is exclusive"/>
            </xsl:if>
        </div>
        <div class="track-body">
            <div class="track-more">
                Downloadable: 
                <xsl:value-of select="downloadable"/> | 
                Download count: 
                <xsl:value-of select="download-count"/> | 
                Purchase URL: 
                <xsl:value-of select="purchase-url"/>
            </div>
            <iframe class="track-player" width="100%" height="166" scrolling="no" frameborder="no">
                <xsl:attribute name="src">
                    <xsl:value-of select = "concat('https://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F',id,'%3Fsecret_token%3D',secret-token)"/>
                </xsl:attribute>
            </iframe>
            <div class="description">    
                <xsl:value-of select="description"/>
            </div>
        </div>            
    </xsl:template>
</xsl:stylesheet>