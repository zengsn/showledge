package com.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.UserDao;
import com.opensymphony.xwork2.ActionSupport;
import com.po.User;

public class SettingAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private User user;
	private File file;// 对应文件域和页面中file input的name保持一致
	private String fileContentType;// 前面的File属性的名字 + ContentType（固定的)
	private String fileFileName;// 前面的File属性的名字 + FileName（固定的）
	private String savePath;// 保存路径

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public String printSetting() throws Exception {
		UserDao userDao = new UserDao();
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setCharacterEncoding("UTF-8");
		String userName = "";
		userName = (String) request.getSession().getAttribute("user");
		user.setName(userName);
		User user2 = userDao.findUserByName(user);
		user = user2;
		return "success";
	}

	public String updateBaseSetting() throws Exception {
		UserDao userDao = new UserDao();
		boolean result = userDao.updateUserName(user);
		printSetting();
		if (result) {
			return "success";
		} else {
			return "error";
		}
	}

	public String updateHeadImg() throws Exception {
		FileOutputStream fos = null;
		FileInputStream fis = null;
		HttpServletRequest request = ServletActionContext.getRequest();
		String root = request.getSession().getServletContext().getRealPath("");
		String imgUrl = root + getSavePath() + "\\" + getFileFileName();
		try {
			// 建立文件输出流
			fos = new FileOutputStream(imgUrl);
			// 建立文件上传流
			fis = new FileInputStream(getFile());
			byte[] buffer = new byte[1024];
			int len = 0;
			while ((len = fis.read(buffer)) > 0) {
				fos.write(buffer, 0, len);
			}
		} catch (Exception e) {
			System.out.println("文件上传失败");
			e.printStackTrace();
		} finally {
			fis.close();
			fos.close();
		}
		UserDao userDao = new UserDao();
		user.setImg(imgUrl);
		boolean result = userDao.updateUserImg(user);
		printSetting();
		if (result) {
			return "success";
		} else {
			return "error";
		}
	}

	public String updatePwd() throws Exception {
		UserDao userDao = new UserDao();
		boolean result = userDao.updateUserPwd(user);
		printSetting();
		if (result) {
			return "success";
		} else {
			return "error";
		}
	}
}
