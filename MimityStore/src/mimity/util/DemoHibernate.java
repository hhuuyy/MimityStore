package mimity.util;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import mimity.entity.Category;

public class DemoHibernate {

	public static void main(String[] args) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();

		try {
			session.getTransaction().begin();
			String sql = "From Category";
			Query query = session.createQuery(sql);
			List<Category> list = query.list();
			
			for (Category cate : list) {
				System.out.println("Name: " + cate.getName());
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}

	}

}
