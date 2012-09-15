<?xml version="1.0" encoding="UTF-8"?>
<!--
  This XSL is used to transform merged configuration output where each block is
  in customer style format.
  
  For example:
  
  <validate>
    <validation_report/>
  </validate>
  
  <discover>
    <discover_report/>
  </discover>
  
  <read>
    <read_report/>
  </read>
 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="xml" version="1.0" indent="yes" cdata-section-elements ="value"/> 
    
  <xsl:template match="/validation_reports">
    
    <xsl:element name="validation_report">
    
      <!-- Process errors -->
      <xsl:if test="count(descendant::error) > 0">
	      <xsl:element name="errors">
	    
		      <!-- Loop over each inidividual report -->
		      <xsl:for-each select="validation_report">
		        <xsl:variable name="validator_name" select="name"/>
		        
		        <xsl:if test="errors">
		          <xsl:element name="{$validator_name}">
			          <xsl:element name="error_list">
			            <xsl:for-each select="errors/error">
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
	          </xsl:if>
		      </xsl:for-each>
	      </xsl:element>
	    </xsl:if>
	    
	    <!-- Process checks -->
      <xsl:if test="count(descendant::check) > 0">
        <xsl:element name="extensions">
      
          <!-- Loop over each inidividual report -->
          <xsl:for-each select="validation_report">
            <xsl:variable name="validator_name" select="name"/>
            
            <xsl:if test="checks">
              <xsl:element name="{$validator_name}">
                <xsl:element name="name">
				          <xsl:value-of select="name"/>
				        </xsl:element>
				        <xsl:element name="details">
			            <xsl:value-of select="details"/>
	  		        </xsl:element>
                <xsl:element name="message">
                  <xsl:value-of select="summary"/>
                </xsl:element>
                <xsl:element name="probes">
                  <xsl:for-each select="checks/check">
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
            </xsl:if>
          </xsl:for-each>
        </xsl:element>
      </xsl:if>
    
    </xsl:element>
    
  </xsl:template>
  
  <xsl:template match="/discovery_reports">
    
    <xsl:element name="discovery_reports">
    
      <!-- Process errors -->
      <xsl:if test="count(descendant::error) > 0">
        <xsl:element name="errors">
      
          <!-- Loop over each inidividual report -->
          <xsl:for-each select="discovery_report">
            <xsl:variable name="discovery_name" select="name"/>
            
            <xsl:if test="errors">
              <xsl:element name="{$discovery_name}">
                <xsl:element name="error_list">
                  <xsl:for-each select="errors/error">
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
            </xsl:if>
          </xsl:for-each>
        </xsl:element>
      </xsl:if>
      
      <!-- Process results -->
      <xsl:if test="count(descendant::result) > 0">
        <xsl:element name="extensions">
      
          <!-- Loop over each inidividual report -->
          <xsl:for-each select="discovery_report">
            <xsl:variable name="discovery_name" select="name"/>
            
            <xsl:if test="results">
              <xsl:element name="{$discovery_name}">
                <xsl:element name="name">
                  <xsl:value-of select="display_name"/>
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
            </xsl:if>
          </xsl:for-each>
        </xsl:element>
      </xsl:if>
    
    </xsl:element>
    
  </xsl:template>
  
  
</xsl:stylesheet>