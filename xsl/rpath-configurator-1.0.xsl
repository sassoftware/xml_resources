<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="xml" version="1.0" indent="yes" cdata-section-elements ="value"/> 
  
  <xsl:template match="/validation_report">
    
    <xsl:element name="validation_report">
    
      <!-- Process errors if they exist -->
      <xsl:if test="errors"> 
        <xsl:apply-templates select="errors"/>
      </xsl:if>
	    
	    <!-- Process checks if they exist -->
      <xsl:if test="checks">
        <xsl:apply-templates select="checks"/>
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
    
    <xsl:element name="discovery_report">
    
      <!-- Process errors if they exist -->
      <xsl:if test="errors"> 
        <xsl:element name="errors">
          <xsl:element name="name">
            <xsl:element name="error_list">
              <xsl:apply-templates select="errors"/>
            </xsl:element>
          </xsl:element>
        </xsl:element>
      </xsl:if>
      
      <!-- Process checks if they exist -->
      <xsl:if test="results">
        <xsl:apply-templates select="results"/>
      </xsl:if>
      
    <!-- Process success if it exist -->
    <xsl:if test="success">
      <xsl:element name="status">
        <xsl:value-of select="success"/>
      </xsl:element>
    </xsl:if>
      
    </xsl:element>
  </xsl:template>
  
  <!-- Results template -->
  <xsl:template match="results">
    <xsl:variable name="discovery_name" select="/discovery_report/name"/>
    <xsl:element name="extensions">
      <xsl:element name="{$discovery_name}">
        <xsl:element name="name">
          <xsl:value-of select="/discovery_report/display_name"/>
        </xsl:element>
        <xsl:element name="probes">
          <xsl:for-each select="result">
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
  </xsl:template>
  
  <!-- Checks template -->
  <xsl:template match="checks">
    <xsl:variable name="validator_name" select="/validation_report/name"/>
    <xsl:element name="extensions">
       <xsl:element name="{$validator_name}">
         <xsl:element name="name">
           <xsl:value-of select="/validation_report/display_name"/>
         </xsl:element>
         <xsl:element name="details">
           <xsl:value-of select="/validation_report/details"/>
         </xsl:element>
         <xsl:element name="message">
           <xsl:value-of select="/validation_report/summary"/>
         </xsl:element>
         <xsl:element name="probes">
			     <xsl:for-each select="check">
			       <xsl:variable name="check_name" select="name" />
			       <xsl:element name="{$check_name}">
			         <xsl:element name="message">
			           <xsl:value-of select="summary"/>
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
  </xsl:template>
  
  <!-- Generic error template -->
  <xsl:template match="errors">
    <xsl:variable name="config_name" select="/*/name"/>
    <xsl:element name="errors">
      <xsl:element name="${config_name}">
        <xsl:element name="error_list">
			    <xsl:for-each select="error">
			       <xsl:element name="error">
			         <xsl:element name="code">
			           <xsl:value-of select="code"/>
			         </xsl:element>
			         <xsl:element name="detail">
			           <xsl:value-of select="details"/>
			         </xsl:element>
			         <xsl:element name="message">
			           <xsl:value-of select="summary"/>
			         </xsl:element>
			       </xsl:element>
			    </xsl:for-each>
			    </xsl:element>
       </xsl:element>
     </xsl:element>
  </xsl:template>
</xsl:stylesheet>