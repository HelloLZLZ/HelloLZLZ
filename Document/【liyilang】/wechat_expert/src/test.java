
import org.expert.dao.HibernateInit;
import org.expert.pojo.Bussiness;
import org.expert.pojo.Expert;
import org.expert.pojo.Profile;
import org.hibernate.Session;


public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Session session=null;
/*       Profile profile=new Profile();
        profile.setUsername("00");
        profile.setCareerExp("1");
        profile.setEducation("12");
        profile.setFileUrl("ss");
        profile.setInterests("da");
        profile.setIntro("11a");
        profile.setPicUrl("zz");*/
/*		Expert expert=new Expert();
		expert.setUsername("yy");
		expert.setDomain("dd");
		expert.setMajor("D");
		expert.setPassword("111");*/
		Bussiness bussiness=new Bussiness();
		bussiness.setDomain("dd");
		bussiness.setName("ff");
		try {
			session=HibernateInit.getSession();
			session.beginTransaction();
			session.save(bussiness);
			session.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			session.getTransaction().rollback();
			System.out.print("save data fail");
			e.printStackTrace();
		}finally{
			HibernateInit.closeSession();
		}
		
		

	}

}
