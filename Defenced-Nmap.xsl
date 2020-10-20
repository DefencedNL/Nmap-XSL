<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>
  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta name="referrer" content="no-referrer"/> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css" type="text/css" integrity="sha384-VEpVDzPR2x8NbTDZ8NFW4AWbtT2g/ollEzX/daZdW/YvUBlbgVtsxMftnJ84k0Cn" crossorigin="anonymous"/>
        <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha384-fJU6sGmyn07b+uD1nMk7/iSb4yvaowcueiQhfVgQuD98rfva8mcr1eSvjchfpMrH" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" integrity="sha384-rgWRqC0OFPisxlUvl332tiM/qmaNxnlY46eksSZD84t+s2vZlqGeHrncwIRX7CGp" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js" integrity="sha384-7PXRkl4YJnEpP8uU4ev9652TTZSxrqC8uOpcV1ftVEC7LVyLZqqDUAaq+Y+lGgr9" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <style>
          .target:before {
            content: "";
            display: block;
            height: 50px;
            margin: -20px 0 0;
          }
          @media only screen and (min-width:1900px) {
            .container {
              width: 1800px;
              }
          }
          .footer {
            margin-top:60px;
            padding-top:60px;
            width: 100%;
            height: 180px;
            background-color: #f5f5f5;
          }
          .clickable {
            cursor: pointer;
          }
          .panel-heading > h3:before {
            font-family: 'Glyphicons Halflings';
            content: "\e114"; /* glyphicon-chevron-down */
            padding-right: 1em;
          }
          .panel-heading.collapsed > h3:before {
            content: "\e080"; /* glyphicon-chevron-right */
          }
        </style>
        <title>Defenced - Nmap Scan Report</title>
      </head>
      <body>
        <nav class="navbar navbar-default navbar-fixed-top">
          <div class="container-fluid">
            <div class="navbar-header">
	      <img src="data:image/png;base64,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" width="100" alt="Defenced"></img> 
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-home"></span></a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav">
                <li><a href="#scannedhosts">Scanned Hosts</a></li>
                <li><a href="#onlinehosts">Online Hosts</a></li>
                <li><a href="#openservices">Open Services</a></li>
              </ul>
            </div>
          </div>
        </nav>
        <div class="container">
          <div class="jumbotron">
            <h1>Scan Report<br/><small>Nmap <xsl:value-of select="/nmaprun/@version"/></small></h1>
            <pre style="white-space:pre-wrap; word-wrap:break-word;"><xsl:value-of select="/nmaprun/@args"/></pre>
            <p class="lead">
              <xsl:value-of select="/nmaprun/@startstr"/> – <xsl:value-of select="/nmaprun/runstats/finished/@timestr"/><br/>
              <xsl:value-of select="/nmaprun/runstats/hosts/@total"/> hosts scanned.
              <xsl:value-of select="/nmaprun/runstats/hosts/@up"/> hosts up.
              <xsl:value-of select="/nmaprun/runstats/hosts/@down"/> hosts down.
            </p>
            <div class="progress">
              <div class="progress-bar progress-bar-success" style="width: 0%">
                <xsl:attribute name="style">width:<xsl:value-of select="/nmaprun/runstats/hosts/@up div /nmaprun/runstats/hosts/@total * 100"/>%;</xsl:attribute>
                <xsl:value-of select="/nmaprun/runstats/hosts/@up"/>
                <span class="sr-only"></span>
              </div>
              <div class="progress-bar progress-bar-danger" style="width: 0%">
                <xsl:attribute name="style">width:<xsl:value-of select="/nmaprun/runstats/hosts/@down div /nmaprun/runstats/hosts/@total * 100"/>%;</xsl:attribute>
                <xsl:value-of select="/nmaprun/runstats/hosts/@down"/>
                <span class="sr-only"></span>
              </div>
            </div>
          </div>
          <h2 id="scannedhosts" class="target">Scanned Hosts<xsl:if test="/nmaprun/runstats/hosts/@down > 1024"><small> (offline hosts are hidden)</small></xsl:if></h2>
          <div class="table-responsive">
            <table id="table-overview" class="table table-striped dataTable" role="grid">
              <thead>
                <tr>
                  <th>State</th>
                  <th>Address</th>
                  <th>Hostname</th>
                  <th>TCP (open)</th>
                  <th>UDP (open)</th>
                </tr>
              </thead>
              <tbody>
                <xsl:choose>
                  <xsl:when test="/nmaprun/runstats/hosts/@down > 1024">
                    <xsl:for-each select="/nmaprun/host[status/@state='up']">
                      <tr>
                        <td><span class="label label-danger"><xsl:if test="status/@state='up'"><xsl:attribute name="class">label label-success</xsl:attribute></xsl:if><xsl:value-of select="status/@state"/></span></td>
                        <td><xsl:value-of select="address/@addr"/></td>
                        <td><xsl:value-of select="hostnames/hostname/@name"/></td>
                        <td><xsl:value-of select="count(ports/port[state/@state='open' and @protocol='tcp'])"/></td>
                        <td><xsl:value-of select="count(ports/port[state/@state='open' and @protocol='udp'])"/></td>
                      </tr>
                    </xsl:for-each>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:for-each select="/nmaprun/host">
                      <tr>
                        <td><span class="label label-danger"><xsl:if test="status/@state='up'"><xsl:attribute name="class">label label-success</xsl:attribute></xsl:if><xsl:value-of select="status/@state"/></span></td>
                        <td><xsl:value-of select="address/@addr"/></td>
                        <td><xsl:value-of select="hostnames/hostname/@name"/></td>
                        <td><xsl:value-of select="count(ports/port[state/@state='open' and @protocol='tcp'])"/></td>
                        <td><xsl:value-of select="count(ports/port[state/@state='open' and @protocol='udp'])"/></td>
                      </tr>
                    </xsl:for-each>
                  </xsl:otherwise>
                </xsl:choose>
              </tbody>
            </table>
          </div>
          <script>
            $(document).ready(function() {
              $('#table-overview').DataTable();
            });
          </script>
          <h2 id="onlinehosts" class="target">Online Hosts</h2>
          <xsl:for-each select="/nmaprun/host[status/@state='up']">
            <div class="panel panel-default">
              <div class="panel-heading clickable" data-toggle="collapse">
                  <xsl:attribute name="data-target">#<xsl:value-of select="translate(address/@addr, '.', '-')"/></xsl:attribute>
                <h3 class="panel-title"><xsl:value-of select="address/@addr"/><xsl:if test="count(hostnames/hostname) > 0"> - <xsl:value-of select="hostnames/hostname/@name"/></xsl:if></h3>
              </div>
              <div class="panel-body collapse in">
                <xsl:attribute name="id"><xsl:value-of select="translate(address/@addr, '.', '-')"/></xsl:attribute>
                <xsl:if test="count(hostnames/hostname) > 0">
                  <h4>Hostnames</h4>
                  <ul>
                    <xsl:for-each select="hostnames/hostname">
                      <li><xsl:value-of select="@name"/> (<xsl:value-of select="@type"/>)</li>
                    </xsl:for-each>
                  </ul>
                </xsl:if>
                <h4>Ports</h4>
                <div class="table-responsive">
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th>Port</th>
                        <th>Protocol</th>
                        <th>State<br/>Reason</th>
                        <th>Service</th>
                        <th>Product</th>
                        <th>Version</th>
                        <th>Extra Info</th>
                      </tr>
                    </thead>
                    <tbody>
                      <xsl:for-each select="ports/port">
                        <xsl:choose>
                          <xsl:when test="state/@state = 'open'">
                            <tr class="success">
                              <td title="Port"><xsl:value-of select="@portid"/></td>
                              <td title="Protocol"><xsl:value-of select="@protocol"/></td>
                              <td title="State / Reason"><xsl:value-of select="state/@state"/><br/><xsl:value-of select="state/@reason"/></td>
                              <td title="Service"><xsl:value-of select="service/@name"/></td>
                              <td title="Product"><xsl:value-of select="service/@product"/></td>
                              <td title="Version"><xsl:value-of select="service/@version"/></td>
                              <td title="Extra Info"><xsl:value-of select="service/@extrainfo"/></td>
                            </tr>
                            <tr>
                              <td colspan="7">
                                <a><xsl:attribute name="href">https://nvd.nist.gov/vuln/search/results?form_type=Advanced&amp;cves=on&amp;cpe_version=<xsl:value-of select="service/cpe"/></xsl:attribute><xsl:value-of select="service/cpe"/></a>
                                <xsl:for-each select="script">
                                  <h5><xsl:value-of select="@id"/></h5>
                                  <pre style="white-space:pre-wrap; word-wrap:break-word;"><xsl:value-of select="@output"/></pre>
                                </xsl:for-each>
                              </td>
                            </tr>
                          </xsl:when>
                          <xsl:when test="state/@state = 'filtered'">
                            <tr class="warning">
                              <td><xsl:value-of select="@portid"/></td>
                              <td><xsl:value-of select="@protocol"/></td>
                              <td><xsl:value-of select="state/@state"/><br/><xsl:value-of select="state/@reason"/></td>
                              <td><xsl:value-of select="service/@name"/></td>
                              <td><xsl:value-of select="service/@product"/></td>
                              <td><xsl:value-of select="service/@version"/></td>
                              <td><xsl:value-of select="service/@extrainfo"/></td>
                            </tr>
                          </xsl:when>
                          <xsl:when test="state/@state = 'closed'">
                            <tr class="active">
                              <td><xsl:value-of select="@portid"/></td>
                              <td><xsl:value-of select="@protocol"/></td>
                              <td><xsl:value-of select="state/@state"/><br/><xsl:value-of select="state/@reason"/></td>
                              <td><xsl:value-of select="service/@name"/></td>
                              <td><xsl:value-of select="service/@product"/></td>
                              <td><xsl:value-of select="service/@version"/></td>
                              <td><xsl:value-of select="service/@extrainfo"/></td>
                            </tr>
                          </xsl:when>
                          <xsl:otherwise>
                            <tr class="info">
                              <td><xsl:value-of select="@portid"/></td>
                              <td><xsl:value-of select="@protocol"/></td>
                              <td><xsl:value-of select="state/@state"/><br/><xsl:value-of select="state/@reason"/></td>
                              <td><xsl:value-of select="service/@name"/></td>
                              <td><xsl:value-of select="service/@product"/></td>
                              <td><xsl:value-of select="service/@version"/></td>
                              <td><xsl:value-of select="service/@extrainfo"/></td>
                            </tr>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:for-each>
                    </tbody>
                  </table>
                </div>
                <xsl:if test="count(hostscript/script) > 0">
                  <h4>Host Script</h4>
                </xsl:if>
                <xsl:for-each select="hostscript/script">
                  <h5><xsl:value-of select="@id"/></h5>
                  <pre style="white-space:pre-wrap; word-wrap:break-word;"><xsl:value-of select="@output"/></pre>
                </xsl:for-each>
                <xsl:if test="count(os/osmatch) > 0">
                  <h4>OS Detection</h4>
                  <xsl:for-each select="os/osmatch">
                    <h5>OS details: <xsl:value-of select="@name"/> (<xsl:value-of select="@accuracy"/>%)</h5>
                    <xsl:for-each select="osclass">
                      Device type: <xsl:value-of select="@type"/><br/>
                      Running: <xsl:value-of select="@vendor"/><xsl:text> </xsl:text><xsl:value-of select="@osfamily"/><xsl:text> </xsl:text><xsl:value-of select="@osgen"/> (<xsl:value-of select="@accuracy"/>%)<br/>
                      OS CPE: <a><xsl:attribute name="href">https://nvd.nist.gov/vuln/search/results?form_type=Advanced&amp;cves=on&amp;cpe_version=<xsl:value-of select="cpe"/></xsl:attribute><xsl:value-of select="cpe"/></a>
                      <br/>
                    </xsl:for-each>
                    <br/>
                  </xsl:for-each>
                </xsl:if>
              </div>
            </div>
          </xsl:for-each>
          <h2 id="openservices" class="target">Open Services</h2>
          <div class="table-responsive">
            <table id="table-services" class="table table-striped dataTable" role="grid">
              <thead>
                <tr>
                  <th>Address</th>
                  <th>Port</th>
                  <th>Protocol</th>
                  <th>Service</th>
                  <th>Product</th>
                  <th>Version</th>
                  <th>CPE</th>
                  <th>Extra info</th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="/nmaprun/host">
                  <xsl:for-each select="ports/port[state/@state='open']">
                    <tr>
                      <td><xsl:value-of select="../../address/@addr"/><xsl:if test="count(../../hostnames/hostname) > 0"> - <xsl:value-of select="../../hostnames/hostname/@name"/></xsl:if></td>
                      <td><xsl:value-of select="@portid"/></td>
                      <td><xsl:value-of select="@protocol"/></td>
                      <td><xsl:value-of select="service/@name"/></td>
                      <td><xsl:value-of select="service/@product"/></td>
                      <td><xsl:value-of select="service/@version"/></td>
                      <td><xsl:value-of select="service/cpe"/></td>
                      <td><xsl:value-of select="service/@extrainfo"/></td>
                    </tr>
                  </xsl:for-each>
                </xsl:for-each>
              </tbody>
            </table>
          </div>
          <script>
            $(document).ready(function() {
              $('#table-services').DataTable();
            });
          </script>
        </div>
        <footer class="footer">
          <div class="container">
            <p class="text-muted">
              &#xA9; Defenced B.V.
            </p>
          </div>
        </footer>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
