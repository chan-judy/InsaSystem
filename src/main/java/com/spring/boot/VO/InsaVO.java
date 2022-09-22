package com.spring.boot.VO;

import lombok.Data;

@Data
public class InsaVO {

	private int sabun;
	private String years;
	private String zip;
	private String salary;
	private String name;
	private String eng_name;
	private String id;
	private String pwd;
	private String phone;
	private String hp;
	private String reg_no;
	private String sex;
	private String email;
	private String addr1;
	private String addr2;
	private String job_type;
	private String pos_gbn_code;
	private String dept_code;
	private String join_gbn_code;
	private String gart_level;
	private String put_yn;
	private String mil_yn;
	private String mil_type;
	private String mil_level;
	private String mil_startdate;
	private String mil_enddate;
	private String kosa_reg_yn;
	private String kosa_class_code;
	private String join_day;
	private String retire_day;
	private String crm_name;
	private String cmp_reg_no;
	private String cmp_reg_image;
	private String carrier;
	private String profile;
	private String self_intro;
	private String profile_image;
	private String carrier_image;
	
	@Override
	public String toString() {
		return "name=" + name + ", eng_name=" + eng_name + ", id=" + id + ", pwd=" + pwd + ", phone=" + phone + ", hp="
				+ hp + ", reg_no=" + reg_no + ", years=" + years + ", sex=" + sex + ", email=" + email + ", zip=" + zip
				+ ", addr1=" + addr1 + ", addr2=" + addr2 + ", job_type=" + job_type + ", pos_gbn_code=" + pos_gbn_code
				+ ", dept_code=" + dept_code + ", salary=" + salary + ", join_gbn_code=" + join_gbn_code + ", gart_level="
				+ gart_level + ", put_yn=" + put_yn + ", mil_yn=" + mil_yn + ", mil_type=" + mil_type + ", mil_level="
				+ mil_level + ", mil_startdate=" + mil_startdate + ", mil_enddate=" + mil_enddate + ", kosa_reg_yn="
				+ kosa_reg_yn + ", kosa_class_code=" + kosa_class_code + ", join_day=" + join_day + ", retire_day=" + retire_day
				+ ", crm_name=" + crm_name + ", cmp_reg_no=" + cmp_reg_no + ", cmp_reg_image=" + cmp_reg_image + ", carrier="
				+ carrier + ", profile=" + profile + ", self_intro=" + self_intro+", self_intro=" + self_intro+", self_intro=" + self_intro;
	}
}