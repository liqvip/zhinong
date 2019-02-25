package cn.blogss.shiro;/*
 *Created by liqiang on 2019/2/24
 */

import cn.blogss.pojo.Users;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

public class ShiroMd5Util {
    public static String  getMd5Password(Users user) {
        String hashAlgorithmName = "MD5";//加密方式

        Object source =user.getPassword();//密码原值

        ByteSource salt = ByteSource.Util.bytes(user.getUsername());//盐值

        int hashIterations = 1;//加密次数

        SimpleHash hash = new SimpleHash(hashAlgorithmName,source);

        return hash.toString();
    }
}
