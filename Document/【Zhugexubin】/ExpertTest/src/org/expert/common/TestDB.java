package org.expert.common;


public class TestDB {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		if(DbUtils.getConnection() != null){
			System.out.println("数据库连接成功");
		}
	}

}
