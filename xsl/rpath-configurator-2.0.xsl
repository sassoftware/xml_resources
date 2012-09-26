<?xml version="1.0" encoding="UTF-8"?>
<!--
  This XSL is used to transform merged configuration output where each block is
  in customer style format.
  
  For example:
  
  <validation_reports>
    <validation_report/>
  </validation_reports>
  
  <discovery_reports>
    <discover_report/>
  </discovery_reports>
 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="xml" version="1.0" indent="yes" cdata-section-elements ="value details detail"/> 
    
  <xsl:template match="/validation_reports">
    
    <xsl:element name="validation_report">
    
      <!-- Process errors -->
      <xsl:if test="count(descendant::error) > 0">
	      <xsl:element name="errors">
	    
		      <!-- Loop over each individual report -->
		      <xsl:for-each select="validation_report">
		        <xsl:variable name="validator_name" select="name"/>
		        
		        <xsl:if test="errors">
		          <xsl:element name="{$validator_name}">
		            <xsl:element name="name">
		              <xsl:value-of select="$validator_name"/>
		            </xsl:element>
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
      
          <!-- Loop over each individual report -->
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
                <xsl:choose>
                   <xsl:when test="success[text() = 'false']">
                     <xsl:element name="status">fail</xsl:element>
                   </xsl:when>
                  <xsl:otherwise>
                    <xsl:element name="status">pass</xsl:element>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:element name="probes">
                  <xsl:for-each select="checks/check">
                    <xsl:variable name="check_name" select="name" />
			              <xsl:element name="{$check_name}">
			                <xsl:element name="message">
			                  <xsl:value-of select="summary"/>
			                </xsl:element>
			                <xsl:element name="details">
                        <xsl:value-of select="details"/>
                      </xsl:element>
			                <xsl:element name="name">
			                  <xsl:value-of select="display_name"/>
			                </xsl:element>
			                <xsl:choose>
                        <xsl:when test="success[text() = 'false']">
                          <xsl:element name="status">fail</xsl:element>
                        </xsl:when>
                       <xsl:otherwise>
                         <xsl:element name="status">pass</xsl:element>
                       </xsl:otherwise>
                     </xsl:choose>
                    </xsl:element>
                  </xsl:for-each>
                </xsl:element>
              </xsl:element>
            </xsl:if>
          </xsl:for-each>
        </xsl:element>
      </xsl:if>
      
      <!-- Add overall success flag -->
      <xsl:choose>
       <xsl:when test="count(validation_report/success[text() = 'false']) > 0">
         <xsl:element name="status">fail</xsl:element>
       </xsl:when>
       <xsl:otherwise>
         <xsl:element name="status">pass</xsl:element>
       </xsl:otherwise>
     </xsl:choose>
    
    </xsl:element>
    
  </xsl:template>
  
  <xsl:template match="/discovery_reports">
    
    <xsl:element name="discovered_properties">
    
      <!-- Store whether or not there were errors -->
      <xsl:variable name="has_errors" select="count(descendant::error) > 0"/>
    
      <!-- Process errors -->
      <xsl:if test="$has_errors">
        <xsl:element name="errors">
      
          <!-- Loop over each individual report -->
          <xsl:for-each select="discovery_report">
            <xsl:variable name="discovery_name" select="name"/>
            
            <xsl:if test="errors">
              <xsl:element name="{$discovery_name}">
                <xsl:element name="name">
                  <xsl:value-of select="$discovery_name"/>
                </xsl:element>
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
      
          <!-- Loop over each individual report -->
          <xsl:for-each select="discovery_report">
            <xsl:variable name="discovery_name" select="name"/>
            
            <xsl:if test="result">
              <xsl:element name="{$discovery_name}">
                <xsl:element name="name">
                  <xsl:value-of select="display_name"/>
                </xsl:element>
                <xsl:element name="probes">
                  <xsl:variable name="result_name" select="name" />
                  <xsl:element name="{$result_name}">
                    <xsl:element name="name">
		                <xsl:value-of select="display_name"/>
		              </xsl:element>
		              <xsl:element name="value">
		                <xsl:value-of select="result"/>
		              </xsl:element>
                  </xsl:element>
                </xsl:element>
              </xsl:element>
            </xsl:if>
          </xsl:for-each>
        </xsl:element>
      </xsl:if>
      
      <!-- Add overall status flag -->
      <xsl:choose>
       <xsl:when test="$has_errors">
         <xsl:element name="status">fail</xsl:element>
       </xsl:when>
       <xsl:otherwise>
         <xsl:element name="status">pass</xsl:element>
       </xsl:otherwise>
     </xsl:choose>
    
    </xsl:element>
    
  </xsl:template>
  
  
  <xsl:template match="/read_reports">
    
    <xsl:element name="observed_properties">
    
      <!-- Store whether or not there were errors -->
      <xsl:variable name="has_errors" select="count(descendant::error) > 0"/>
    
      <!-- Process errors -->
      <xsl:if test="$has_errors">
        <xsl:element name="errors">
      
          <!-- Loop over each individual report -->
          <xsl:for-each select="read_report">
            <xsl:variable name="read_name" select="name"/>
            
            <xsl:if test="errors">
              <xsl:element name="{$read_name}">
                <xsl:element name="name">
                  <xsl:value-of select="$read_name"/>
                </xsl:element>
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
      
      <!-- Process properties -->
      <xsl:if test="count(descendant::property) > 0">
        <xsl:element name="extensions">
      
          <!-- Loop over each individual report -->
          <xsl:for-each select="read_report">
            <xsl:if test="properties">
	            <xsl:variable name="read_name" select="name"/>
	            <xsl:element name="{$read_name}">
	              <xsl:for-each select="properties/property">
		              <xsl:variable name="property_name" select="name"/>
		              <xsl:element name="{$property_name}">
		                <xsl:value-of select="value"/>
		              </xsl:element>
	              </xsl:for-each>
	            </xsl:element>
            </xsl:if>
          </xsl:for-each>
        </xsl:element>
      </xsl:if>
      
      <!-- Add overall status flag -->
      <xsl:choose>
       <xsl:when test="$has_errors">
         <xsl:element name="status">fail</xsl:element>
       </xsl:when>
       <xsl:otherwise>
         <xsl:element name="status">pass</xsl:element>
       </xsl:otherwise>
     </xsl:choose>
    
    </xsl:element>
    
  </xsl:template>
  
  <xsl:template match="/write_reports">
    
    <xsl:element name="write_status">
    
      <!-- Store whether or not there were errors -->
      <xsl:variable name="has_errors" select="count(descendant::error) > 0"/>
    
      <!-- Process errors -->
      <xsl:if test="$has_errors">
        <xsl:element name="errors">
      
          <!-- Loop over each individual report -->
          <xsl:for-each select="write_report">
            <xsl:variable name="write_name" select="name"/>
            
            <xsl:if test="errors">
              <xsl:element name="{$write_name}">
                <xsl:element name="name">
                  <xsl:value-of select="$write_name"/>
                </xsl:element>
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
      
      <!-- Add overall status flag -->
      <xsl:choose>
       <xsl:when test="$has_errors">
         <xsl:element name="status">fail</xsl:element>
       </xsl:when>
       <xsl:otherwise>
         <xsl:element name="status">pass</xsl:element>
       </xsl:otherwise>
     </xsl:choose>
    
    </xsl:element>
    
  </xsl:template>
  
</xsl:stylesheet>