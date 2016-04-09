package com.guanglumedia.cms.admin.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guanglumedia.cms.admin.dao.UserDao;
import com.guanglumedia.cms.admin.entity.User;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.common.util.security.MD5Utils;

@Service
public class UserService {
    @Autowired
    private UserDao userdao;

    @Transactional
    public PagedModelList<User> findAllUserList(User user, int pageNo, int pageRow) throws UnsupportedEncodingException {
        if (user.getNickName() != null) {
            String nickName = new String(user.getNickName().getBytes("ISO-8859-1"), "utf-8");
            user.setNickName(nickName);
        }
        if (user.getPhone()!= null) {
            String phone = new String(user.getPhone().getBytes("ISO-8859-1"), "utf-8");
            user.setPhone(phone);
        }
        List<User> list = this.userdao.findUserList(user, new RowBounds((pageNo - 1) * pageRow, pageRow));
        int count = this.userdao.findCount();
        PagedModelList<User> pml = new PagedModelList<User>(pageNo, pageRow, count);
        pml.addModels(list);
        return pml;
    }

    public User getUserById(int id) {
        return userdao.getUserById(id);
    }

    public int HasLoginName(String rname, String id) {
        return userdao.hasLoginName(rname,id);
    }

    public int UpdateUser(User user) {
        return userdao.UpdateUser(user);
    }

    public int AddUser(User user) {
        user.setPassword(MD5Utils.getMD5(user.getPassword()));
        return userdao.addUser(user);
    }

    public int DelUser(int id) {
        return userdao.delUser(id);
    }

	public int getUserByGroupId(int id) {
		return userdao.getUserByGroupId(id);
	}

}
