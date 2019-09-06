package com.xu.pojo;

/*
* create table `user`(
	`id` int not null primary key auto_increment comment  "用户ID",
	`username` varchar(20) not null comment  "用户账号",
	`password` varchar(50) not null comment  "用户密码",
	`realname` varchar(15) not null comment  "用户姓名",
	`sex` varchar(1) not null comment  "用户性别",
	`time`  datetime not null comment  "用户注册时间",
	`mail` varchar(20) not null comment  "用户邮箱",
	`active` varchar(1) not null comment  "用户是否激活",
	`code` varchar(100) not null comment  "用户激活码"
)

* */
//用户信息
public class User {
    private int id;  //用户ID
    private String username; //用户账号
    private String password; //用户密码
    private String realname; //用户姓名
    private String sex; //用户性别
    private String time; //用户注册时间
    private String mail; //用户邮箱
    private String active; //用户是否激活
    private String mailcode; //用户激活码

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getActive() {
        return active;
    }

    public void setActive(String active) {
        this.active = active;
    }

    public String getMailcode() {
        return mailcode;
    }

    public void setMailcode(String mailcode) {
        this.mailcode = mailcode;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", realname='" + realname + '\'' +
                ", sex='" + sex + '\'' +
                ", time='" + time + '\'' +
                ", mail='" + mail + '\'' +
                ", active='" + active + '\'' +
                ", code='" + mailcode + '\'' +
                '}';
    }
}
