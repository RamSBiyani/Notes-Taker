package com.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
	public static SessionFactory sf;

	public static SessionFactory getFactory() {

		if (sf == null) {
			Configuration con = new Configuration();
			sf = con.configure("hibernate.cfg.xml").buildSessionFactory();
		}

		return sf;
	}

	public void closeFactory() {
		if (sf.isOpen()) {
			sf.close();
		}
	}
}
