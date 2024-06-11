package org.example;

import org.apache.fop.apps.FOUserAgent;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;

public class Main {
    public static void main(String[] args) {
        try {

            String xmlFilePath = "C:/Users/bilgiislem4/Desktop/VLA2019000000001_b01468c8-738a-48c9-b467-185afb8aba15.xml";
            String xsltFilePath = "C:/Users/bilgiislem4/Desktop/xmltopdf/src/main/resources/template.xslt"; // Bu dosyanın yolunu kontrol edin
            String pdfFilePath = "C:/Users/bilgiislem4/Desktop/invoice.pdf";


            File configFile = new File("C:/Users/bilgiislem4/Desktop/xmltopdf/src/main/resources/fop.xconf");
            FopFactory fopFactory = FopFactory.newInstance(configFile.toURI());

            FOUserAgent foUserAgent = fopFactory.newFOUserAgent();


            OutputStream out = new FileOutputStream(new File(pdfFilePath));

            try {

                Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, out);


                TransformerFactory transformerFactory = TransformerFactory.newInstance();
                Transformer transformer = transformerFactory.newTransformer(new StreamSource(new File(xsltFilePath)));


                transformer.transform(new StreamSource(new File(xmlFilePath)), new SAXResult(fop.getDefaultHandler()));
            } finally {
                out.close();
            }

            System.out.println("PDF dönüştürme işlemi başarıyla tamamlandı!");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
