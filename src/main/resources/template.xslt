<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4" page-height="29.7cm" page-width="21cm" margin-top="2cm" margin-bottom="2cm" margin-left="2cm" margin-right="2cm">
                    <fo:region-body margin-top="3cm" margin-bottom="3cm"/>
                    <fo:region-before extent="2cm"/>
                    <fo:region-after extent="2cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="A4">
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block font-size="14pt" font-weight="bold" text-align="center">
                        Fatura
                    </fo:block>
                </fo:static-content>

                <fo:static-content flow-name="xsl-region-after">
                    <fo:block font-size="10pt" text-align="center">
                        e-Arşiv Fatura
                    </fo:block>
                </fo:static-content>

                <fo:flow flow-name="xsl-region-body">
                    <!-- Müşteri Bilgileri -->
                    <fo:block font-size="12pt">
                        <fo:block font-weight="bold">SAYIN</fo:block>
                        <fo:block>
                            <xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyName/cbc:Name"/><br/>
                            <xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
                            <xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber"/><br/>
                            <xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName"/><br/>
                            <xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName"/><br/>
                            <xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone"/><br/>
                            Tel: <xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telephone"/><br/>
                            Vergi Dairesi: <xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:TaxSchemeID"/><br/>
                            TCKN: <xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:Person/cbc:ID"/>
                        </fo:block>
                    </fo:block>

                    <!-- Fatura Detayları -->
                    <fo:block font-size="12pt">
                        <fo:block font-weight="bold">Fatura Detayları</fo:block>
                        <fo:block>
                            Özelleştirme No: <xsl:value-of select="//cbc:CustomizationID"/><br/>
                            Senaryo: <xsl:value-of select="//cbc:ProfileID"/><br/>
                            Fatura Tipi: <xsl:value-of select="//cbc:InvoiceTypeCode"/><br/>
                            Fatura No: <xsl:value-of select="//cbc:ID"/><br/>
                            Fatura Tarihi: <xsl:value-of select="//cbc:IssueDate"/>
                        </fo:block>
                    </fo:block>

                    <!-- Not -->
                    <fo:block font-size="12pt">
                        <fo:block font-weight="bold">Not:</fo:block>
                        <fo:block>
                            <xsl:value-of select="//cbc:Note[1]"/><br/>
                            <xsl:value-of select="//cbc:Note[2]"/><br/>
                            <xsl:value-of select="//cbc:Note[3]"/>
                        </fo:block>
                    </fo:block>

                    <!-- Firma Bilgileri -->
                    <fo:block font-size="12pt">
                        <fo:block font-weight="bold">Volta Motor Sanayi ve Ticaret A.Ş.</fo:block>
                        <fo:block>
                            <xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyName/cbc:Name"/><br/>
                            <xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
                            <xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber"/><br/>
                            PK: <xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:PostalZone"/>
                            <xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CityName"/> /
                            <xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Country/cbc:Name"/><br/>
                            Tel: <xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telephone"/><br/>
                            Web Sitesi: <xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cbc:WebsiteURI"/><br/>
                            Vergi Dairesi: <xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:TaxSchemeID"/><br/>
                            VKN: <xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID"/><br/>
                            MERSISNO: <xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
                        </fo:block>
                    </fo:block>

                    <!-- Fatura Kalemleri -->
                    <fo:table width="100%" border="0.5pt solid black" border-collapse="collapse">
                        <fo:table-header>
                            <fo:table-row>
                                <fo:table-cell><fo:block>Sıra No</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block>Mal Hizmet</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block>Miktar</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block>Birim Fiyat</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block>İskonto Oranı</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block>İskonto Tutarı</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block>KDV Oranı</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block>KDV Tutarı</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block>Diğer Vergiler</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block>Mal Hizmet Tutarı</fo:block></fo:table-cell>
                            </fo:table-row>
                        </fo:table-header>
                        <fo:table-body>
                            <xsl:for-each select="//cac:InvoiceLine">
                                <fo:table-row>
                                    <fo:table-cell><fo:block><xsl:value-of select="cbc:ID"/></fo:block></fo:table-cell>
                                    <fo:table-cell><fo:block><xsl:value-of select="cac:Item/cbc:Name"/></fo:block></fo:table-cell>
                                    <fo:table-cell><fo:block><xsl:value-of select="cbc:InvoicedQuantity"/> <xsl:value-of select="cbc:InvoicedQuantity/@unitCode"/></fo:block></fo:table-cell>
                                    <fo:table-cell><fo:block><xsl:value-of select="cac:Price/cbc:PriceAmount"/> TL</fo:block></fo:table-cell>
                                    <fo:table-cell><fo:block><xsl:value-of select="cac:AllowanceCharge/cbc:MultiplierFactorNumeric"/>%</fo:block></fo:table-cell>
                                    <fo:table-cell><fo:block><xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/> TL</fo:block></fo:table-cell>
                                    <fo:table-cell><fo:block><xsl:value-of select="cac:TaxTotal/cac:TaxSubtotal/cbc:Percent"/>%</fo:block></fo:table-cell>
                                    <fo:table-cell><fo:block><xsl:value-of select="cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount"/> TL</fo:block></fo:table-cell>
                                    <fo:table-cell><fo:block><xsl:value-of select="cac:TaxTotal/cbc:TaxAmount"/> TL</fo:block></fo:table-cell>
                                    <fo:table-cell><fo:block><xsl:value-of select="cbc:LineExtensionAmount"/> TL</fo:block></fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                        </fo:table-body>
                    </fo:table>

                    <!-- Toplamlar -->
                    <fo:block font-size="12pt">
                        <fo:block font-weight="bold">Toplamlar</fo:block>
                        <fo:block>
                            Mal Hizmet Toplam Tutarı: <xsl:value-of select="//cbc:LegalMonetaryTotal/cbc:LineExtensionAmount"/> TL<br/>
                            Toplam İskonto: <xsl:value-of select="//cbc:LegalMonetaryTotal/cbc:AllowanceTotalAmount"/> TL<br/>
                            Hesaplanan KDV: <xsl:value-of select="//cac:TaxTotal/cbc:TaxAmount"/> TL<br/>
                            Vergiler Dahil Toplam Tutar: <xsl:value-of select="//cbc:LegalMonetaryTotal/cbc:TaxInclusiveAmount"/> TL<br/>
                            Ödenecek Tutar: <xsl:value-of select="//cbc:LegalMonetaryTotal/cbc:PayableAmount"/> TL
                        </fo:block>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>
