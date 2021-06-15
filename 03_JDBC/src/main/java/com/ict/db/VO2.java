package com.ict.db;

public class VO2 {
	// DB의 컬럼명과 변수명이 같아야 한다.
		private String num, name, title, email, pw, reg;

		// 생성자가 필요하면 만들고, 필요없으면 생략가능
		
		// gettr, setter
		public String getNum() {
			return num;
		}

		public void setNum(String num) {
			this.num = num;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getPw() {
			return pw;
		}

		public void setPw(String pw) {
			this.pw = pw;
		}

		public String getReg() {
			return reg;
		}

		public void setReg(String reg) {
			this.reg = reg;
		}


		
}
