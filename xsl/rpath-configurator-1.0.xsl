<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="xml" version="1.0" indent="yes" cdata-section-elements ="value"/> 
  
  <xsl:template match="/validation_report">
  
    <!-- Store the configurator name -->
    <xsl:variable name="configurator_name" select="name" />
    
    <xsl:element name="validation_report">
    
      <!-- Process errors if they exist -->
      <xsl:if test="errors"> 
        <xsl:element name="errors">
          <xsl:element name="{$configurator_name}">
            <xsl:element name="error_list">
              <xsl:for-each select="errors/error">
                 <xsl:element name="error">
                   <xsl:element name="code">
                     <xsl:value-of select="code"/>
                   </xsl:element>
                   <xsl:element name="detail">
                     <xsl:value-of select="detail"/>
                   </xsl:element>
                   <xsl:element name="message">
                     <xsl:value-of select="message"/>
                   </xsl:element>
                 </xsl:element>
              </xsl:for-each>
            </xsl:element>
          </xsl:element>
        </xsl:element>
      </xsl:if>
	    
	    <!-- Process checks if they exist -->
      <xsl:if test="checks">
        <xsl:element name="extensions">
          <xsl:element name="{$configurator_name}">
            <xsl:element name="name">
              <xsl:value-of select="name"/>
            </xsl:element>
            <xsl:element name="details">
              <xsl:value-of select="details"/>
            </xsl:element>
            <xsl:element name="message">
              <xsl:value-of select="message"/>
            </xsl:element>
            <xsl:element name="probes">
              <xsl:for-each select="checks/check">
                <xsl:variable name="check_name" select="name" />
                <xsl:element name="{$check_name}">
                  <xsl:element name="message">
                    <xsl:value-of select="message"/>
                  </xsl:element>
                  <xsl:element name="name">
                    <xsl:value-of select="display_name"/>
                  </xsl:element>
                  <xsl:element name="status">
                    <xsl:value-of select="success"/>
                  </xsl:element>
                </xsl:element>
              </xsl:for-each>
            </xsl:element>
          </xsl:element>
        </xsl:element>
      </xsl:if>
	    
	  <!-- Process success if it exist -->
    <xsl:if test="success">
      <xsl:element name="status">
        <xsl:value-of select="success"/>
      </xsl:element>
    </xsl:if>
	    
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="/discovery_report">
  
    <!-- Store the configurator name -->
    <xsl:variable name="configurator_name" select="name" />
    
    <xsl:element name="discovery_report">
    
      <!-- Process errors if they exist -->
      <xsl:if test="errors"> 
        <xsl:element name="errors">
          <xsl:element name="{$configurator_name}">
            <xsl:element name="error_list">
              <xsl:for-each select="errors/error">
                 <xsl:element name="error">
	                 <xsl:element name="code">
	                   <xsl:value-of select="code"/>
	                 </xsl:element>
	                 <xsl:element name="detail">
	                   <xsl:value-of select="detail"/>
	                 </xsl:element>
	                 <xsl:element name="message">
	                   <xsl:value-of select="message"/>
	                 </xsl:element>
	               </xsl:element>
              </xsl:for-each>
            </xsl:element>
          </xsl:element>
        </xsl:element>
      </xsl:if>
      
      <!-- Process checks if they exist -->
      <xsl:if test="results">
        <xsl:element name="extensions">
          <xsl:element name="{$configurator_name}">
            <xsl:element name="name">
              <xsl:value-of select="name"/>
            </xsl:element>
            <xsl:element name="details">
              <xsl:value-of select="details"/>
            </xsl:element>
            <xsl:element name="message">
              <xsl:value-of select="message"/>
            </xsl:element>
            <xsl:element name="probes">
              <xsl:for-each select="results/result">
                <xsl:variable name="result_name" select="name" />
                <xsl:element name="{$result_name}">
                  <xsl:element name="name">
                    <xsl:value-of select="display_name"/>
                  </xsl:element>
                  <xsl:element name="value">
                    <xsl:value-of select="value"/>
                  </xsl:element>
                </xsl:element>
              </xsl:for-each>
            </xsl:element>
          </xsl:element>
        </xsl:element>
      </xsl:if>
      
    <!-- Process success if it exist -->
    <xsl:if test="success">
      <xsl:element name="status">
        <xsl:value-of select="success"/>
      </xsl:element>
    </xsl:if>
      
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>