package com.nec.slcm.graph.test;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.stream.StreamResult;

import net.sf.saxon.Configuration;
import net.sf.saxon.dom.DocumentWrapper;
import net.sf.saxon.query.DynamicQueryContext;
import net.sf.saxon.query.StaticQueryContext;
import net.sf.saxon.query.XQueryExpression;
import net.sf.saxon.trans.XPathException;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

public class Main {

	private static Logger logger = Logger.getLogger(Main.class.getName());
	private static Session sess;
	private static Reader reader;
	private static Writer writer;
	private static JSch jsch = new JSch();
	private static Channel channel = null;

	/**
	 * 生产文档对象
	 * 
	 * @param xml
	 *            文件名
	 * @return
	 */
	private static Document getDocument(String xml) {
		DocumentBuilderFactory builderFactory = DocumentBuilderFactory
				.newInstance();
		DocumentBuilder builder;
		Document document = null;
		try {
			builder = builderFactory.newDocumentBuilder();
			document = builder.parse(xml);
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		document.normalize();
		return document;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		testDate();
		testArrayList();
		testBineryFile();
		testLog4j();
		testXQuery();
		testJSch();
	}

	private static void testJSch() {
		System.out
				.println(connectServer("qcg", "qu-cg123", "172.28.14.237", 22));
		System.out.println(doPs());
		System.out.println(getOperatorList());
	}

	private static int connectServer(String user, String pwd, String host,
			int port) {
		try {
			sess = jsch.getSession(user, host, port);
			sess.setPassword(pwd);
			sess.setConfig("StrictHostKeyChecking", "no");

			sess.connect();

			channel = sess.openChannel("shell");
			InputStream is = channel.getInputStream();
			OutputStream os = channel.getOutputStream();
			reader = new BufferedReader(new InputStreamReader(is));
			writer = new BufferedWriter(new OutputStreamWriter(os));

			channel.connect();

		} catch (Exception e) {
			if (jsch != null)
				jsch = null;
			if (sess != null && sess.isConnected())
				sess.disconnect();
			if (channel != null && channel.isConnected()) {
				channel.disconnect();
			}
			return 1;
		}
		return 0;
	}

	private static int doPs() {
		if (sess == null || !sess.isConnected()) {
			System.out.println("请先连接服务。。。");
			return 1;
		}
		try {
			writer.write("ps -ef\n");
			writer.flush();
		} catch (Exception e) {
			System.out.println("ps出错。。。");
			return 1;
		}
		return 0;
	}

	private static int getOperatorList() {
		int msgNum = 0;
		char[] msgBuffer = new char[8 * 1024];
		// 如果没有解析的话，则解析输入
		try {
			while (!reader.ready()) {
			}
			while ((msgNum = reader.read(msgBuffer)) != 0)
				for (int i = 0; i < msgBuffer.length; i++) {
					System.out.print(msgBuffer[i]);
				}
		} catch (IOException e) {
			msgNum = 2;
			// 服务器未返回正确结果;
		}
		return msgNum;
	}

	private static void testArrayList() {
		ArrayList<String> list = new ArrayList<String>();
		list.add(Messages.getString("Main.0")); //$NON-NLS-1$
		list.add(Messages.getString("Main.1")); //$NON-NLS-1$
		for (String item : list) {
			System.out.println(item);
		}
	}

	private static void testBineryFile() {
		File f = new File("/home/qcg/bin/colorcat");
		try {
			FileInputStream fis = new FileInputStream(f);
			byte[] data = new byte[10];
			fis.read(data);
			System.out.printf("%c%c%c\n", data[1], data[2], data[3]);
			fis.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private static void testDate() {
		System.out.println(Messages.getString("Main.2")); //$NON-NLS-1$
		Date d = new Date(123);
		System.out.println(d.getTime());
	}

	private static void testLog4j() {
		// BasicConfigurator.configure();
		PropertyConfigurator
				.configure("src/com/nec/slcm/graph/test/log4j.properties");
		logger.debug("debug");
		logger.info("information");
		logger.warn("warning");
		logger.error("error");
	}

	private static void testXQuery() {
		// 文件
		String fileString = "src/com/nec/slcm/graph/test/books.xml";
		// 查询语句
		String query = "/bookstore/book/title";
		query="/bookstore/book[price<30]";
		query="/bookstore/book[price>30]/title";
		query="for $x in /bookstore/book where $x/price>30 return $x/title";
		query="for $x in /bookstore/book where $x/price>30 order by $x/title return $x/title";
		query="for $x in /bookstore/book return	if ($x/@category=\"CHILDREN\") then <child>{data($x/title)}</child> else <adult>{data($x/title)}</adult>";
		// 生产文档对象
		Document document = getDocument(fileString);
		Configuration configuration = new Configuration();
		StaticQueryContext context = new StaticQueryContext(configuration,
				false);
		// 查询表达式对象
		XQueryExpression expression = null;
		try {
			expression = context.compileQuery(query);
			DynamicQueryContext context2 = new DynamicQueryContext(
					configuration);
			context2.setContextItem(new DocumentWrapper(document, null,
					configuration));

			final Properties props = new Properties();
			props.setProperty(OutputKeys.METHOD, "xml");
			props.setProperty(OutputKeys.INDENT, "yes");
			// 执行查询，并输出查询结果
			expression.run(context2, new StreamResult(System.out), props);
		} catch (XPathException e) {
			e.printStackTrace();
		}

	}
}
