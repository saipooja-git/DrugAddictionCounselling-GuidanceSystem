package com.voidmain.dao;

import java.util.List;

import com.voidmain.pojo.Client;
import com.voidmain.pojo.Counselor;
import com.voidmain.pojo.Login;
import com.voidmain.pojo.Message;
import com.voidmain.pojo.Review;
import com.voidmain.pojo.Schedule;

public class HibernateDAO {

	public static String isValidUser(String username,String password)
	{
		String result="0";

		Login login=getLoginById(username);

		if(login!=null && login.getPassword().equals(password))
		{
			result=login.getRole();
		}

		return result;
	}
	
	public static boolean isUserRegistred(String username)
	{
		boolean isRegistred=false;

		for(Login login : getLogins())
		{
			if(login.getUsername().toLowerCase().equals(username.toLowerCase()))
			{
				isRegistred=true;
				
				break;
			}
		}
		
		return isRegistred;
	}

	//================================================================================

	public static Login getLoginById(String username)
	{
		return (Login)HibernateTemplate.getObject(Login.class,username);
	}

	public static int deleteLogin(String username)
	{
		return HibernateTemplate.deleteObject(Login.class,username);
	}

	public static List<Login> getLogins()
	{
		List<Login> logins=(List)HibernateTemplate.getObjectListByQuery("From Login");

		return logins;
	}

	//================================================================================

	public static Counselor getCounselorById(String username)
	{
		return (Counselor)HibernateTemplate.getObject(Counselor.class,username);
	}

	public static int deleteCounselor(String username)
	{
		return HibernateTemplate.deleteObject(Counselor.class,username);
	}

	public static List<Counselor> getCounselors()
	{
		List<Counselor> counselors=(List)HibernateTemplate.getObjectListByQuery("From Counselor");

		return counselors;
	}

	//================================================================================

	public static Client getClientById(String username)
	{
		return (Client)HibernateTemplate.getObject(Client.class,username);
	}

	public static int deleteClient(String username)
	{
		return HibernateTemplate.deleteObject(Client.class,username);
	}

	public static List<Client> getClients()
	{
		List<Client> clients=(List)HibernateTemplate.getObjectListByQuery("From Client");

		return clients;
	}

	//================================================================================

	public static Message getMessageById(int id)
	{
		return (Message)HibernateTemplate.getObject(Message.class,id);
	}

	public static int deleteMessage(int id)
	{
		return HibernateTemplate.deleteObject(Message.class,id);
	}

	public static List<Message> getMessages()
	{
		List<Message> messages=(List)HibernateTemplate.getObjectListByQuery("From Message");

		return messages;
	}

	//================================================================================

	public static Review getReviewById(int id)
	{
		return (Review)HibernateTemplate.getObject(Review.class,id);
	}

	public static int deleteReview(int id)
	{
		return HibernateTemplate.deleteObject(Review.class,id);
	}

	public static List<Review> getReviews()
	{
		List<Review> reviews=(List)HibernateTemplate.getObjectListByQuery("From Review");

		return reviews;
	}

	//================================================================================

	public static Schedule getScheduleById(int id)
	{
		return (Schedule)HibernateTemplate.getObject(Schedule.class,id);
	}

	public static int deleteSchedule(int id)
	{
		return HibernateTemplate.deleteObject(Schedule.class,id);
	}

	public static List<Schedule> getSchedules()
	{
		List<Schedule> schedules=(List)HibernateTemplate.getObjectListByQuery("From Schedule");

		return schedules;
	}
}
