<?xml version="1.0"?> 
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:mim="http://www.geostandaarden.nl/mim/mim-core/1.1"
    xmlns:mim-ext="http://www.geostandaarden.nl/mim/mim-ext/1.0"
    xmlns:mim-ref="http://www.geostandaarden.nl/mim/mim-ref/1.0"
    version="1.1">
<xsl:output method="html" indent="yes"/>


<!-- documentroot -->
<xsl:template match="/mim:Informatiemodel">
  <html>
    <head>
      <link rel="stylesheet" href="Geonovumstyle.css" />
    </head>
    <body>
      
      <h1>Report on document</h1>
      <h2>Gegevens over het model</h2>

      <table>
        <tr>
          <td><b>element</b></td>
          <td><b>waarde</b></td>
        </tr>
        <tr>
          <td><b>naam</b></td>
          <td><xsl:value-of select="mim:naam"/></td>
        </tr>
        <tr>
          <td><b>relatiemodelleringstype</b></td>
          <td><xsl:value-of select="mim:relatiemodelleringstype"/></td>
        </tr>
        <tr>
          <td><b>MIMVersie</b></td>
          <td><xsl:value-of select="mim:MIMVersie"/></td>
        </tr>
        <tr>
          <td><b>MIMTaal</b></td>
          <td><xsl:value-of select="mim:MIMTaal"/></td>
        </tr>
      </table>


      <h2>Domeinen</h2>

      <xsl:apply-templates select='mim:packages/mim:Domein' />

      <h2>Domeinen</h2>

      <table>
        <tr>
          <td><b>klasse</b></td>
          <td><b>attribuut</b></td>
          <td><b>type</b></td>
          <td><b>kard</b></td>
          <td><b>lengte</b></td>
          <td><b>patroon</b></td>
          <td><b>formeel patroon</b></td>
          <td><b>meeteenheid</b></td>
          <td><b>min</b></td>
          <td><b>max</b></td>
        </tr>
        
        <xsl:apply-templates select='//mim:DataElement|//mim:Attribuutsoort' mode='report' />
      </table>
      
    </body>
  </html>
</xsl:template>

<!-- author in documentroot -->
<xsl:template match="mim:Domein">
  <h3>Domein: <xsl:value-of select="mim:naam"/></h3>

  <h4>Datatypen</h4>

  <xsl:apply-templates select='mim:datatypen' />
</xsl:template>


<xsl:template match="mim:PrimitiefDatatype">
  <h5>Naam: <xsl:value-of select="mim:naam"/></h5>
</xsl:template>

<!-- author in documentroot -->
<xsl:template match="mim:DataElement|mim:Attribuutsoort" mode='report'>
<tr>
  <td><xsl:value-of select="../../mim:naam"/></td>
  <td><xsl:value-of select="mim:naam"/></td>
  <td><xsl:value-of select="mim:type/mim-ref:InterfaceRef|mim:type/mim-ref:DatatypeRef"/></td>
  <td><xsl:value-of select="mim:kardinaliteit"/></td>
  <td><xsl:value-of select="mim:lengte"/></td>
  <td><xsl:value-of select="mim:patroon"/></td>
  <td><xsl:value-of select="mim:formeelPatroon"/></td>
  <td><xsl:value-of select="mim-ext:kenmerken/mim-ext:kenmerk[@naam='Meeteenheid' or @naam='meeteenheid']"/> </td>
  <td><xsl:value-of select="mim-ext:kenmerken/mim-ext:kenmerk[@naam='Minimumwaarde' or @naam='minimumwaarde']"/> </td>
  <td><xsl:value-of select="mim-ext:kenmerken/mim-ext:kenmerk[@naam='Maximumwaarde' or @naam='maximumwaarde']"/></td>
</tr>
</xsl:template>

</xsl:stylesheet>
