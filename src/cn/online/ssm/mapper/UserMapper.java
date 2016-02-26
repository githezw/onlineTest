package cn.online.ssm.mapper;

/**
 * Created by hezw on 2016/2/22.
 */
public interface UserMapper {
    String stuLogin(String realname) throws Exception;
    String teaLogin(String realname) throws Exception;
}
